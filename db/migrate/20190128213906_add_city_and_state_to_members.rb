class AddCityAndStateToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :city, :string
    add_column :members, :state, :string
  end
end
