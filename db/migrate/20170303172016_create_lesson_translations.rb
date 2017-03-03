class CreateLessonTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :lesson_translations do |t|
      t.belongs_to :lesson, index: true
      t.belongs_to :language
      t.text :content
      t.integer :status, default: 0
      t.integer :sequential_id, null: false
      t.timestamps
    end
  end
end
