# == Schema Information
#
# Table name: user_courses
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  course_id   :integer
#  is_complete :boolean          default("false"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "test_helper"

class UserCourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
