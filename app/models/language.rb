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
class Language < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :user_languages
  has_many :users, :through => :user_languages
  has_many :course_languages
  has_many :courses, :through => :course_languages
  has_many :lesson_translations
end
