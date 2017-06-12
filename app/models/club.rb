class Club < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :club_reviews, dependent: :destroy

  # 会员分享帖子收藏功能

  has_many :club_collections
  has_many :members, through: :club_collections, source: :user

  # 会员分享帖子点赞功能

  has_many :club_votes
  has_many :members, through: :club_votes, source: :user

end
