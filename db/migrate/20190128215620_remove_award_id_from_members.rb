class RemoveAwardIdFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :award_id, :integer
    remove_column :members, :skill_id, :integer
    remove_column :members, :education_id, :integer
    remove_column :members, :experience_id, :integer
  end
end
