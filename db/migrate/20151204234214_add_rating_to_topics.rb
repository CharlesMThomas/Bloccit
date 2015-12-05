class AddRatingToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :rating_id, :integer
  end
end
