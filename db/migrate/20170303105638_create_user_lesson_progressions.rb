class CreateUserLessonProgressions < ActiveRecord::Migration[5.0]
  def change
    create_table :user_lesson_progressions do |t|
      t.belongs_to :user, index: true
      t.belongs_to :lesson, index: true
      t.belongs_to :subject, index: true
      t.belongs_to :course, index: true
      t.timestamps
    end
  end
end
