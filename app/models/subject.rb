# == Schema Information
#
# Table name: subjects
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  description   :text
#  sequential_id :integer          not null
#  active        :boolean          default("false"), not null
#  approved      :boolean          default("false"), not null
#  course_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Subject < ApplicationRecord
  belongs_to :course
  acts_as_sequenced :scope => :course_id

  # Automatically use the sequential ID in URLs
  def to_param
    sequential_id.to_s
  end
end
