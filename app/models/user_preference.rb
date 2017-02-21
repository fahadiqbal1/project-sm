# == Schema Information
#
# Table name: user_preferences
#
#  id                   :integer          not null, primary key
#  user_id              :integer
#  gender               :string           default("N/A")
#  country_of_origin    :string
#  country_of_residence :string
#  consent              :boolean          default("false"), not null
#  age                  :date
#  first_name           :string
#  last_name            :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  delivery_time        :string           default("morning")
#
class UserPreference < ApplicationRecord
  belongs_to :user
  accepts_nested_attributes_for :user
end
