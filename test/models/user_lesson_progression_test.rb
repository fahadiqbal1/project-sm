# == Schema Information
#
# Table name: user_lesson_progressions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  lesson_id  :integer
#  subject_id :integer
#  course_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class UserLessonProgressionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
