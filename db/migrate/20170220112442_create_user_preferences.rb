class CreateUserPreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :user_preferences do |t|
      t.belongs_to :user, index: true, unique: true, foreign_key: true
      t.string :gender, null: true, default: 'N/A'
      t.string :country_of_origin, null: true
      t.string :country_of_residence, null: true
      t.boolean :consent, null: false, default: false
      t.date :age, null: true
      t.string :first_name, null: true
      t.string :last_name, null: true
      t.timestamps
    end
  end
end
