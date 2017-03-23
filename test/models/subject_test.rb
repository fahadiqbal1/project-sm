# == Schema Information
#
# Table name: subjects
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  description   :text
#  sequential_id :integer          not null
#  course_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  status        :integer          default("0")
#

require "test_helper"

class SubjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
