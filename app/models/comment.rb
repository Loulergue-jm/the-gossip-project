class Comment < ApplicationRecord
  belongs_to :gossip
  belongs_to :user
  validates :content, presence: true, length: {in: 3..150}
end
