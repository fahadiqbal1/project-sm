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
end
