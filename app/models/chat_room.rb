class ChatRoom < ApplicationRecord
  belongs_to :user
  has_many :public_messages, dependent: :destroy
end
