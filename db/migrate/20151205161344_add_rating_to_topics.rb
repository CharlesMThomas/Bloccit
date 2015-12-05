class AddRatingToTopics < ActiveRecord::Migration
  def change
    add_reference :topics, :rating, index: true, foreign_key: true
  end
end
