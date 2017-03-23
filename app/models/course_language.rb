# == Schema Information
#
# Table name: course_languages
#
#  id          :integer          not null, primary key
#  course_id   :integer
#  language_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class CourseLanguage < ApplicationRecord
  belongs_to :course
  belongs_to :language
end
