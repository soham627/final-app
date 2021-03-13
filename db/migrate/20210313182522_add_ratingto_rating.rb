class AddRatingtoRating < ActiveRecord::Migration[6.0]
  def change
    add_column :ratings, :user_rating, :integer
  end
end
