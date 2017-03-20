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
class Course < ApplicationRecord
  has_paper_trail :only => [:name, :description, :status]
  has_many :subjects, :dependent => :destroy
  has_many :lessons, :through => :subjects
  has_many :user_courses
  has_many :users, :through => :user_courses
  has_many :course_languages
  has_many :languages, :through => :course_languages

  enum :status => [:inactive, :approved, :active]

  accepts_nested_attributes_for :user_courses, :allow_destroy => true
  accepts_nested_attributes_for :course_languages, :allow_destroy => true
  accepts_nested_attributes_for :subjects, :allow_destroy => true

  validates_presence_of [:name, :description, :sequential_id, :status]
  validates :name, :uniqueness => true
end
