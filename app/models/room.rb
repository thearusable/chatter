class Room < ApplicationRecord

  has_many :user_rooms
  has_many :users, through: :user_rooms

  has_many :messages, as: :messagable

  validates_presence_of :title, presence: true, length: {minimum: 2}
  validates_presence_of :category, presence: true, length: {minimum: 2}
  validates_presence_of :description, presence: true, length: {minimum: 2}


  def room_name(user)
    self.title
  end

  def last_message
    if self.messages
      self.messages.last.body.truncate_words(10)
    else
      "No messages"
    end
  end

end
