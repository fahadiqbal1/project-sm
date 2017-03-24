# Lesson Translation
class LessonTranslationsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_admin!, :except => [:show, :index]
  before_action :set_lesson_translation,
                :only => [:show, :edit, :update, :destroy]

  # GET /lesson_translations/1
  def show
  end

  # GET /lesson_translations/new
  def new
    @lesson_translation = LessonTranslation.new
  end

  # GET /lesson_translations/1/edit
  def edit
  end

  # POST /lesson_translations
  def create
    @lesson_translation = LessonTranslation.new(lesson_translation_params)
    if @lesson_translation.save
      redirect_to [:course, :subject, :lesson, @lesson_translation],
                  :notice => "Lesson translation was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /lesson_translations/1
  def update
    if @lesson_translation.update(lesson_translation_params)
      redirect_to course_path(@lesson_translation.lesson.subject.course),
                  :notice => "Lesson translation was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /lesson_translations/1
  def destroy
    @lesson_translation.destroy
    redirect_to lesson_translations_url,
                :notice => "Lesson translation was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lesson_translation # rubocop:disable Metrics/AbcSize
    @course = Course.find_by(:sequential_id => params[:course_id])
    @subject = @course.subjects.find_by(:sequential_id => params[:subject_id])
    @lesson = @subject.lessons.find_by(:sequential_id => params[:lesson_id])
    @lesson_translation = @lesson.lesson_translations.find_by(
      :sequential_id => params[:id]
    )
  end

  def lesson_translation_params
    params.require(:lesson_translation).permit(
      :content,
      :sequential_id,
      :status
    )
  end
end
