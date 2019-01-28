class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.string :school
      t.string :degree
      t.text :info
      t.date :start
      t.date :end
      t.integer :member_id

      t.timestamps
    end
  end
end
