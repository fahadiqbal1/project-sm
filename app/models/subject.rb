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
class Subject < ApplicationRecord
  has_paper_trail :only => [:name, :description, :status]
  belongs_to :course
  acts_as_sequenced :scope => :course_id
  has_many :lessons, :dependent => :destroy

  enum :status => [:inactive, :approved, :active]

  accepts_nested_attributes_for :course, :allow_destroy => true
  accepts_nested_attributes_for :lessons, :allow_destroy => true

  # Automatically use the sequential ID in URLs
  def to_param
    sequential_id.to_s
  end

  def next
    course.subjects.find_by "subjects.sequential_id > ?", sequential_id
  end

  def prev
    course.subjects.find_by "subjects.sequential_id < ?", sequential_id
  end
end
