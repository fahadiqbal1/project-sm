# == Schema Information
#
# Table name: user_courses
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  course_id   :integer
#  is_complete :boolean          default("false"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class UserCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course
end
