require "test_helper"

class LessonTranslationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in admins(:one)
    @course = courses(:course1)
    @subject = subjects(:subject1)
    @lesson = lessons(:lesson1)
    @lesson_translation = lesson_translations(:one)
  end

  # test "should get index" do
  #   get course_subject_lesson_lesson_translation_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_course_subject_lesson_lesson_translation_url
  #   assert_response :success
  # end

  # test "should create lesson_translation" do
  #   assert_difference("LessonTranslation.count") do
  #     post course_subject_lesson_lesson_translation_url, :params => {
  #       :lesson_translation => {
  #         :lesson_id => 1,
  #         :language_id => 1,
  #         :content => "content"
  #       }
  #     }
  #   end

  #   assert_redirected_to course_subject_lesson_lesson_translation_url(
  #     LessonTranslation.last
  #   )
  # end

  test "should show lesson_translation" do
    get course_subject_lesson_lesson_translation_url(
      :course_id => @course,
      :subject_id => @subject,
      :lesson_id => @lesson,
      :id => @lesson_translation
    )
    assert_response :success
  end

  test "should get edit" do
    get edit_course_subject_lesson_lesson_translation_url(
      :course_id => @course,
      :subject_id => @subject,
      :lesson_id => @lesson,
      :id => @lesson_translation
    )
    assert_response :success
  end

  test "should update lesson_translation" do
    patch course_subject_lesson_lesson_translation_url(
      :course_id => @course,
      :subject_id => @subject,
      :lesson_id => @lesson,
      :id => @lesson_translation
    ),
          :params => { :lesson_translation => {
            :content => "Testing"
          } }
    assert_redirected_to course_url(@course)
  end

  # test "should destroy lesson_translation" do
  #   assert_difference("LessonTranslation.count", -1) do
  #     delete course_subject_lesson_lesson_translation_url(
  #       :course_id => @course,
  #       :subject_id => @subject,
  #       :lesson_id => @lesson,
  #       :id => @lesson_translation
  #     )
  #   end

  #   assert_redirected_to course_url(
  #     :course_id => @course
  #   )
  # end
end
