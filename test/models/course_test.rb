# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  name          :string
#  description   :text
#  sequential_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  status        :integer          default("0")
#

require "test_helper"

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
