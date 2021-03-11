class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :link
      t.text :description
      t.boolean :int_students
      t.date :deadline
      t.integer :industry_id
      t.integer :org_id
      t.text :role

      t.timestamps
    end
  end
end
