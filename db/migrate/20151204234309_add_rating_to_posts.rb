class AddRatingToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :rating_id, :integer
  end
end
