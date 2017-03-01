# Subjects Controller
class SubjectsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_admin!, :except => [:show, :index]

  add_breadcrumb "Courses", :courses_path

  def new
    @course = Course.find(params[:course_id])
    @subject = Subject.new
    add_breadcrumb @course.name, @course
    add_breadcrumb "Add New"
  end

  def show
    @course = Course.find(params[:course_id])
    @subject = @course.subjects.find_by(:sequential_id => params[:id])
    add_breadcrumb @course.name, @course
    add_breadcrumb @subject.name, course_subject_path(
      :course_id => @course,
      :id => @subject
    )
  end
end
