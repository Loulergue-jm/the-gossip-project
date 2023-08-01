class PrivateMessage < ApplicationRecord
	belongs_to :sender, class_name: "User"
	has_many :multi_pms
	has_many :recipients, class_name: "User", through: :multi_pms
	validates :content,	presence: true, length: { minimum: 2 }
end