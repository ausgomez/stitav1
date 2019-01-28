class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :pos_name
      t.string :company
      t.text :description
      t.integer :member_id
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
