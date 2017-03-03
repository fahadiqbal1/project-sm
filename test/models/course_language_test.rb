# == Schema Information
#
# Table name: course_languages
#
#  id          :integer          not null, primary key
#  course_id   :integer
#  language_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "test_helper"

class CourseLanguageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
