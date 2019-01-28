class AddLinksToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :linkedin, :string
    add_column :members, :github, :string
    add_column :members, :twitter, :string
    add_column :members, :facebook, :string
    add_column :members, :instagram, :string
  end
end
