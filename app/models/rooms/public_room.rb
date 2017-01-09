class PublicRoom < Room

  validates_presence_of :title, presence: true, length: {minimum: 2}
  validates_presence_of :category, presence: true, length: {minimum: 2}
  validates_presence_of :description, presence: true, length: {minimum: 2}
  validates_presence_of :owner_id, presence: true


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
