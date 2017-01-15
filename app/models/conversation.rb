class Conversation < ApplicationRecord
  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'

  has_many :messages, dependent: :destroy, as: :messagable

  validates_uniqueness_of :sender_id, :scope => :recipient_id

  scope :involving, -> (user) do
    where("conversations.sender_id =? OR conversations.recipient_id =?",user.id,user.id)
  end

  scope :between, -> (sender_id,recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
  end

  def room_name(user)
    if user.id == self.sender_id
      User.find(self.recipient_id).nickname
    else
      User.find(self.sender_id).nickname
    end
  end

  def last_message
    if self.messages && self.messages.last
      self.messages.last.body.truncate_words(10)
    else
      "No messages"
    end
  end

  def room_avatar(user)
    if user.id == self.sender_id
      User.find(self.recipient_id).avatar
    else
      User.find(self.sender_id).avatar
    end
  end

end
