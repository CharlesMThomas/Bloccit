class Rating < ActiveRecord::Base
  has_many :topics
  has_many :posts

  enum severity: [ :PG, :PG13, :R ]

  def self.update_rating(rating_string)
    Rating.create!(severity: rating_string.to_i).id
  end
end
