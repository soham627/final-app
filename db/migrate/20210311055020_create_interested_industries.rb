class CreateInterestedIndustries < ActiveRecord::Migration[6.0]
  def change
    create_table :interested_industries do |t|
      t.integer :industry_id
      t.integer :user_id

      t.timestamps
    end
  end
end
