class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.string :name, null: false
      t.integer :sequential_id, null: false
      t.boolean :active, default: false, null: false
      t.boolean :approved, default: false, null: false
      t.belongs_to :subject, index: true
      t.timestamps
    end
  end
end
