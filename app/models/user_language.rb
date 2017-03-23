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
class UserLanguage < ApplicationRecord
  belongs_to :user
  belongs_to :language
end
