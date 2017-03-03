# Course Controller
class CoursesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_admin!, :except => [:show, :index]

  add_breadcrumb "Courses", :courses_path

  def index
    @course = Course.all
    add_breadcrumb "Add New", new_course_path if admin_signed_in?
  end

  def new
    @course = Course.new
    add_breadcrumb "Add New", new_course_path
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:notice] = "Course was successfully created."
      redirect_to(@course)
    else
      render :action => "new"
    end
  end

  def show
    @course = Course.find(params[:id])
    add_breadcrumb @course.name, @course
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(course_params)
      flash[:notice] = "Course was successfully updated."
      redirect_to(@course)
    else
      render :action => "edit"
    end
  end

  def destroy
    if current_admin.admin?
      @course = Course.find(params[:id])
      @course.destroy
      flash[:notice] = "Course was successfully removed."
    else
      flash[:alert] = "You do not have permission to do that."
    end

    redirect_to(courses_url)
  end

  private

  def course_params
    params.require(:course).permit(
      :name,
      :description,
      :sequential_id,
      :status,
      :language_ids => []
    )
  end
end
