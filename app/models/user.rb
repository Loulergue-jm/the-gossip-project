class User < ApplicationRecord
    has_secure_password
	belongs_to :city
    has_many :gossips
    has_many :multi_pms
    has_many :private_messages, through: :multi_pms
    has_many :sent_messages, class_name: "PrivateMessage",  foreign_key: "sender_id"
    has_many :received_messages, class_name: "MultiPm",  foreign_key: "recipient_id"
    has_many :comments
    validates :first_name, presence: true
	validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :description, presence: true, length: { minimum: 5 }
    #, format: { with: /\A[^@\s]+@([^@\s]+.)+[^@\s]+\z/, message: 'email adress please',}
    validates :password, presence: true, length: { minimum: 6 }
end
