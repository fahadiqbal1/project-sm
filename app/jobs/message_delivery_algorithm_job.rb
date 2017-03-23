# This job finds the users and the messages that need to be sent
# Called by: soul_medicine task
# Calls: FindMessageTranslationJob
class MessageDeliveryAlgorithmJob < ApplicationJob
  queue_as :default

  rescue_from(StandardError) do |exception|
    logger.error exception.message
  end

  def perform(time_of_day)
    logger.debug "Starting sending messages for #{time_of_day}"
    users = find_users(time_of_day)
    logger.info "Found #{users.count} #{'user'.pluralize(users.count)} to send"\
                " messages for"
    send_messages(users)
    logger.debug "Finished sending messages"
  end

  def find_users(time_of_day)
    case time_of_day
    when "morning"
      User.morning_users
    when "afternoon"
      User.afternoon_users
    when "evening"
      User.evening_users
    else
      User.active
    end
  end

  def send_messages(users) # rubocop:disable Metrics/AbcSize,MethodLength,PerceivedComplexity,LineLength
    logger.debug "Gathering all users"
    users.each do |u| # rubocop:disable Metrics/BlockLength
      logger.debug "Starting algorithm for user_id: #{u.id}"
      # Get the Course(s) that the user is subscribed to(returns array)
      user_courses = u.active_courses
      user_courses.each do |uc| # rubocop:disable Metrics/BlockLength
        logger.debug "Course found. Course_id: #{uc.course_id}"
        logger.debug "Finding lessons that the user has completed for course"
        # Get the Lessons that the user has completed
        user_lesson_completions = u.completed_lessons_for_course(uc.course_id)
        # If the User has not yet started on the course,
        # then send the first lesson of the first
        # subject on that course
        if user_lesson_completions.empty?
          logger.debug "User has not completed any lessons for this course"
          logger.debug "Sending the first lesson of the first subject"
          subject = uc.course.subjects.active.order(:sequential_id).first
          if subject.present?
            lesson = subject.lessons.active.first
            logger.info "Sending lesson #{lesson.id} for subject: #{subject.name}" # rubocop:disable Metrics/LineLength
            FindMessageTranslationJob.perform_later(u, lesson)
          else
            logger.warn "There are no subjects assigned to this course"
          end
        else # If the User has indeed started the course
          last_lesson_sent = u.completed_lessons_for_course(uc.course_id).last
          # If the last lesson that was sent is not the last
          # lesson in the subject, then send the next
          # lesson, otherwise proceed to next check
          if last_lesson_sent.lesson.next.present?
            logger.debug "Sending the next lesson in the subject"
            lesson = last_lesson_sent.lesson.next
            logger.info "Sending lesson #{lesson.id} for subject: #{lesson.subject.name}" # rubocop:disable Metrics/LineLength
            FindMessageTranslationJob.perform_later(u, lesson)
          else
            logger.debug "No more lessons found for subject"
            # If the last lesson sent was the last lesson in the
            # subject, then move on to the next subject's first lesson
            if last_lesson_sent.subject.next.present?
              logger.debug "Starting the next subject on this course for this user: #{u.id}" # rubocop:disable Metrics/LineLength
              lesson = last_lesson_sent.subject.next.lessons.active.first
              logger.debug "Sending lesson #{lesson.id} for subject: #{lesson.subject.name}" # rubocop:disable Metrics/LineLength
              FindMessageTranslationJob.perform_later(u, lesson)
            else
              logger.debug "Course has been completed by the user"
              user_course = UserCourse.find(uc.id)
              user_course.is_complete = true
              user_course.save
            end
          end
        end
      end
    end
  end
end
