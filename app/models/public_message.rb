class PublicMessage < ApplicationRecord
  #Message used in public chat room
  belongs_to :user
  belongs_to :chat_room

  validates :body, presence: true, length: {minimum: 1, maximum: 1000}
end
