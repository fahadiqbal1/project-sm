class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :name, null: false
      t.text :description
      t.integer :sequential_id, null: false
      t.boolean :active, default: false, null: false
      t.boolean :approved, default: false, null: false
      t.belongs_to :course, index: true
      t.timestamps
    end
  end
end
