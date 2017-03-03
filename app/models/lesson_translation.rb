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
class LessonTranslation < ApplicationRecord
  belongs_to :lesson
  belongs_to :language
  acts_as_sequenced :scope => :lesson_id

  enum :status => [:inactive, :approved, :active]

  scope :for_language, lambda { |language|
    joins(:language).where("languages.name = ?", language)
  }

  # Automatically use the sequential ID in URLs
  def to_param
    sequential_id.to_s
  end
end
