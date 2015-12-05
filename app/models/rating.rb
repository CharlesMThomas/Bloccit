# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  severity   :integer
#

class Rating < ActiveRecord::Base
  has_many :topics
  has_many :posts

  enum severity: [ :PG, :PG13, :R ]

  def self.update_rating(rating_string)
    Rating.find_or_create_by!(severity: rating_string.to_i)
    # r
    # raise
  end
end
