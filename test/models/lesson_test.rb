# == Schema Information
#
# Table name: lessons
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  sequential_id :integer          not null
#  subject_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  status        :integer          default("0")
#

require "test_helper"

class LessonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
