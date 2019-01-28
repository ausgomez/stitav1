class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name
      t.text :info
      t.integer :member_id

      t.timestamps
    end
  end
end
