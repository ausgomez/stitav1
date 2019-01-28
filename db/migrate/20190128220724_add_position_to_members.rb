class AddPositionToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :position_id, :int, default: 1
  end
end
