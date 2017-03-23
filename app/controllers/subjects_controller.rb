# Subjects Controller
class SubjectsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_admin!, :except => [:show, :index]
  before_action :set_subject, :only => [:show, :edit, :update, :destroy]

  # GET /subjects/1
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
    @course = Course.find(params[:course_id])
    add_breadcrumb @course.name, @course
    add_breadcrumb "Add New", new_course_subject_path
  end

  # GET /subjects/1/edit
  def edit
    add_breadcrumb @course.name, @course
    add_breadcrumb @subject.name, edit_course_subject_path(
      :course_id => @course, :id => @subject
    )
  end

  # POST /subjects
  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to course_path(
        :id => params[:course_id]
      ), :notice => "Subject was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /subjects/1
  def update
    if @subject.update(subject_params)
      redirect_to course_path(
        :id => params[:course_id]
      ), :notice => "Subject was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /subjects/1
  def destroy
    @subject.destroy
    redirect_to course_path(
      :id => params[:course_id]
    ), :notice => "Subject was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subject
    @course = Course.find_by(:sequential_id => params[:course_id])
    @subject = @course.subjects.find_by(:sequential_id => params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def subject_params
    params.require(:subject).permit(
      :name,
      :description,
      :sequential_id,
      :status,
      :course_id,
      :lessons_attributes => [
        :id,
        :name,
        :sequential_id,
        :status,
        :subject_id
      ]
    )
  end
end
