# Course Controller
class CoursesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_admin!, :except => [:show, :index]

  def index
    @course = Course.all

    respond_to do |wants|
      wants.html # index.html.erb
      wants.xml  { render :xml => @course }
    end
  end

  def new
    @course = Course.new

    respond_to do |wants|
      wants.html # new.html.erb
      wants.xml  { render :xml => @course }
    end
  end

  def show
    @course = Course.find(params[:id])

    respond_to do |wants|
      wants.html # show.html.erb
      wants.xml  { render :xml => @course }
    end
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

  private

  def course_params
    params.require(:course).permit(:name, :description, :sequential_id)
  end
end
