# == Schema Information
#
# Table name: user_languages
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  language_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "test_helper"

class UserLanguageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
