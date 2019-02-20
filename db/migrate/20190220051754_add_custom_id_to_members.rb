class AddCustomIdToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :custom_id, :string
  end
end
