class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.text :bio
      t.integer :favorites_count

      t.timestamps
    end
  end
end
