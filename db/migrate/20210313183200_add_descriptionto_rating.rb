class AddDescriptiontoRating < ActiveRecord::Migration[6.0]
  def change
    add_column :ratings, :explanation, :text
  end
end
