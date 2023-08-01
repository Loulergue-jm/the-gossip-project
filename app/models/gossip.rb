class Gossip < ApplicationRecord
	belongs_to :user
  has_many :tag_gossips
  has_many :tags, through: :tag_gossips
  validates :title, presence: true, length: {in: 3..14}
  validates :content, presence: true, length: { minimum: 10 }
end