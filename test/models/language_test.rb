# == Schema Information
#
# Table name: languages
#
#  id         :integer          not null, primary key
#  name       :string
#  is_active  :boolean          default("true"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class LanguageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
