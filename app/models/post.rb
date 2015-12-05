# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  topic_id   :integer
#  user_id    :integer
#  rating_id  :integer
#

class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings
  belongs_to :rating

  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 5}, presence: true
  validates :body, length: { minimum: 20}, presence: true
  validates :topic, presence: true
  validates :user, presence: true
end
