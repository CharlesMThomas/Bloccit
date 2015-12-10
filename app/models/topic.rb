class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings

  scope :publicaly_viewable, -> { where(public: true) }
  scope :visible_to, -> (user) { user ? all : publicaly_viewable }
  scope :privately_viewable, -> { where(public: false) }


end
