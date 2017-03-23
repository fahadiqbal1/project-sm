class ReplaceActiveAndApprovedWithStatus < ActiveRecord::Migration[5.0]
  def change
    remove_column :lessons, :active, :boolean
    remove_column :lessons, :approved, :boolean
    add_column :lessons, :status, :integer, default: 0
    remove_column :subjects, :active, :boolean
    remove_column :subjects, :approved, :boolean
    add_column :subjects, :status, :integer, default: 0
    remove_column :courses, :active, :boolean
    remove_column :courses, :approved, :boolean
    add_column :courses, :status, :integer, default: 0
  end
end
