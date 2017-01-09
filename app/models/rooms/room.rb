class Room < ApplicationRecord

  has_many :conversations
  has_many :users, through: :conversations

  has_many :messages, dependent: :destroy

end
