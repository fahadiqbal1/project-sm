# == Schema Information
#
# Table name: user_lesson_progressions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  lesson_id  :integer
#  subject_id :integer
#  course_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserLessonProgression < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  belongs_to :subject
  belongs_to :course

  validates_presence_of [:user_id, :lesson_id, :subject_id, :course_id]
  validates_uniqueness_of :lesson_id,
                          :scope => :user_id,
                          :on => :create,
                          :message => "must be unique"
end
