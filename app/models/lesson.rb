# == Schema Information
#
# Table name: lessons
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  sequential_id :integer          not null
#  subject_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  status        :integer          default("0")
#
class Lesson < ApplicationRecord
  belongs_to :subject
  acts_as_sequenced :scope => :subject_id
  delegate :course, :to => :subject, :allow_nil => true
  has_many :lesson_translations

  enum :status => [:inactive, :approved, :active]

  validates :name,
            :uniqueness => { :scope => :subject }
  validates :sequential_id,
            :presence => true,
            :numericality => true,
            :uniqueness => { :scope => :subject }
  validates :subject_id, :presence => true, :numericality => true

  before_create :build_default_translations

  # Automatically use the sequential ID in URLs
  def to_param
    sequential_id.to_s
  end

  def next
    subject.lessons.find_by "lessons.sequential_id > ?", sequential_id
  end

  def prev
    subject.lessons.find_by "lessons.sequential_id < ?", sequential_id
  end

  private

  def build_default_translations
    course.languages.each do |l|
      lesson_translations.build(
        :language_id => l.id
      )
    end
    true
  end
end
