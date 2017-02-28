class CreateUserCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :user_courses do |t|
      t.belongs_to :user, index: true
      t.belongs_to :course, index: true
      t.boolean :is_complete, default: false, null: false
      t.timestamps
    end
  end
end
