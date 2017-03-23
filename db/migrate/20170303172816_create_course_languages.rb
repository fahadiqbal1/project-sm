class CreateCourseLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :course_languages do |t|
      t.belongs_to :course, index: true
      t.belongs_to :language, index: true
      t.timestamps
    end
  end
end
