require "test_helper"

class LessonsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in admins(:one)
    @course = courses(:course1)
    @subject = subjects(:subject1)
    @lesson = lessons(:lesson1)
  end

  # test "should get index" do
  #   get lessons_url
  #   assert_response :success
  # end

  test "should get new" do
    get new_course_subject_lesson_url(
      :course_id => @course,
      :subject_id => @subject
    )
    assert_response :success
  end

  test "should create lesson" do
    assert_difference("Lesson.count") do
      post course_subject_lessons_url(
        :course_id => @course,
        :subject_id => @subject
      ), :params => {
        :lesson => {
          :subject_id => @subject.id,
          :name => "TestABC",
          :sequential_id => 2
        }
      }
    end

    assert_redirected_to course_url(@course)
  end

  test "should show lesson" do
    get course_subject_lesson_url(
      :course_id => @course,
      :subject_id => @subject,
      :id => @lesson
    )
    assert_response :success
  end

  test "should get edit" do
    get edit_course_subject_lesson_url(
      :course_id => @course,
      :subject_id => @subject,
      :id => @lesson
    )
    assert_response :success
  end

  test "should update lesson" do
    patch course_subject_lesson_url(
      :course_id => @course,
      :subject_id => @subject,
      :id => @lesson
    ), :params => {
      :lesson => {
        :name => "Awesome Ninja Warrior of Justice"
      }
    }
    assert_redirected_to course_url(@course)
  end

  test "should destroy lesson" do
    assert_difference("Lesson.count", -1) do
      delete course_subject_lesson_url(
        :course_id => @course,
        :subject_id => @subject,
        :id => @lesson
      )
    end

    assert_redirected_to course_url(@course)
  end
end
