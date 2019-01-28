class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :fn
      t.string :ln
      t.string :about 
      t.text :interests
      t.text :address
      t.string :phone
      t.string :email
      t.string :photo
      t.integer :experience_id
      t.integer :education_id
      t.integer :skill_id
      t.integer :award_id
      t.integer :user_id
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
