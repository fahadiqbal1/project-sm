# == Schema Information
#
# Table name: lesson_translations
#
#  id            :integer          not null, primary key
#  lesson_id     :integer
#  language_id   :integer
#  content       :text
#  status        :integer          default("0")
#  sequential_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require "test_helper"

class LessonTranslationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
