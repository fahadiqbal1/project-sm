require "test_helper"

class LessonTranslationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson_translation = lesson_translations(:one)
  end

  test "should get index" do
    get lesson_translations_url
    assert_response :success
  end

  test "should get new" do
    get new_lesson_translation_url
    assert_response :success
  end

  test "should create lesson_translation" do
    assert_difference("LessonTranslation.count") do
      post lesson_translations_url, :params => { :lesson_translation => {} }
    end

    assert_redirected_to lesson_translation_url(LessonTranslation.last)
  end

  test "should show lesson_translation" do
    get lesson_translation_url(@lesson_translation)
    assert_response :success
  end

  test "should get edit" do
    get edit_lesson_translation_url(@lesson_translation)
    assert_response :success
  end

  test "should update lesson_translation" do
    patch lesson_translation_url(@lesson_translation),
          :params => { :lesson_translation => {} }
    assert_redirected_to lesson_translation_url(@lesson_translation)
  end

  test "should destroy lesson_translation" do
    assert_difference("LessonTranslation.count", -1) do
      delete lesson_translation_url(@lesson_translation)
    end

    assert_redirected_to lesson_translations_url
  end
end
