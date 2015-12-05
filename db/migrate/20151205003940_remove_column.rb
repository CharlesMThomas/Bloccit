class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :posts, :rating_id
  end
end
