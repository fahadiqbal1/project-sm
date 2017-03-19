# Lessons Controller
class LessonsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_admin!, :except => [:show, :index]
  before_action :set_lesson, :only => [:show, :edit, :update, :destroy]

  # GET /lessons/1
  def show
  end

  # GET /lessons/new
  def new
    @course = Course.find(params[:course_id])
    @subject = @course.subjects.find_by(:sequential_id => params[:subject_id])
    @lesson = Lesson.new
    add_breadcrumb @course.name, @course
    add_breadcrumb @subject.name, @course
    add_breadcrumb "Add New", new_course_subject_lesson_path
  end

  # GET /lessons/1/edit
  def edit
    add_breadcrumb @course.name, @course
    add_breadcrumb @subject.name, @course
    add_breadcrumb @lesson.name, edit_course_subject_lesson_path(
      :course_id => @course,
      :subject_id => @subject,
      :id => @lesson
    )
  end

  # POST /lessons
  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      redirect_to course_path(
        :id => params[:course_id]
      ), :notice => "Lesson was successfully created."
    else
      redirect_back(:fallback_location => root_path)
    end
  end

  # PATCH/PUT /lessons/1
  def update
    if @lesson.update(lesson_params)
      redirect_to course_path(
        :id => params[:course_id]
      ), :notice => "Lesson was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /lessons/1
  def destroy
    @lesson.destroy
    redirect_to course_path(
      :id => params[:course_id]
    ), :notice => "Lesson was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lesson
    @course = Course.find(params[:course_id])
    @subject = @course.subjects.find_by(:sequential_id => params[:subject_id])
    @lesson = @subject.lessons.find_by(:sequential_id => params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def lesson_params
    params.require(:lesson).permit(
      :name,
      :sequential_id,
      :status,
      :subject_id
    )
  end
end
