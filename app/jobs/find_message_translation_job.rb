# This job finds the translation for a given user and lesson
# Called by: MessageDeliveryAlgorithmJob
# Calls: SendSmsJob
class FindMessageTranslationJob < ApplicationJob
  queue_as :default

  rescue_from(StandardError) do |exception|
    logger.error exception.message
  end

  def perform(user, lesson) # rubocop:disable Metrics/AbcSize,MethodLength
    logger.debug "Finding Lesson Translations for user_id: #{user.id}"\
                " and lesson_id: #{lesson.id}"
    user.user_languages.each do |lang|
      begin
        logger.debug "Sending Translation for #{lang.language.name}"
        translation = get_translation(lesson, lang.language_id)
        if translation.present? && translation.content.present?
          message = craft_message(translation.content, lesson)
          SendSmsJob.perform_later(user.normalized, message)
        else
          logger.error "ERR! - Translation not found!"
        end
      rescue => e
        logger.error e.message
        logger.error e.backtrace.inspect
      end
    end
    ulp = UserLessonProgression.create!(
      :user_id => user.id,
      :lesson_id => lesson.id,
      :subject_id => lesson.subject.id,
      :course_id => lesson.subject.course.id
    )
    logger.info "Progression ID: #{ulp.id}"
  end

  private

  def get_translation(lesson, language_id)
    lesson.lesson_translations
          .where(:language_id => language_id)
          .active.first
  end

  def craft_message(content, lesson)
    "Here is your lesson for the day!\n"\
    + ActionView::Base.full_sanitizer.sanitize(content.truncate(75))\
    + "\nThe full lesson details can be found here: #{ENV['BASE_URL']}"\
    + Rails.application.routes.url_helpers
      .course_subject_lesson_path(
        :course_id => lesson.course,
        :subject_id => lesson.subject,
        :id => lesson
      )
  end
end
