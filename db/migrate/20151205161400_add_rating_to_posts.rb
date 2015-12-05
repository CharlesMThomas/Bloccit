class AddRatingToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :rating, index: true, foreign_key: true
  end
end
