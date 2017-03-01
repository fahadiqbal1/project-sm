# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  name          :string
#  description   :text
#  sequential_id :integer          not null
#  active        :boolean          default("false"), not null
#  approved      :boolean          default("false"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
  has_many :subjects, :dependent => :destroy
  has_many :user_courses
  has_many :users, :through => :user_courses

  accepts_nested_attributes_for :user_courses, :allow_destroy => true

  validates_presence_of [:name, :description, :sequential_id]
  validates :name, :uniqueness => true

  scope :active, -> { where(:active => true) }
  scope :active_and_approved, -> { where(:active => true, :approved => true) }
end
