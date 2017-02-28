# Subjects Controller
class SubjectsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_admin!, :except => [:show, :index]

  def index
    @course = Course.find(params[:course_id])
    @subject = @course.subjects.where(:course_id => params[:course_id])

    respond_to do |wants|
      wants.html # index.html.erb
      wants.xml  { render :xml => @subject }
    end
  end

  def new
    @subject = Subject.new

    respond_to do |wants|
      wants.html # new.html.erb
      wants.xml  { render :xml => @subject }
    end
  end

  def show
    @course = Course.find(params[:course_id])
    @subject = @course.subjects.find_by(:sequential_id => params[:id])

    respond_to do |wants|
      wants.html # show.html.erb
      wants.xml  { render :xml => @subject }
    end
  end
end
