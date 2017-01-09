class PrivateRoom < Room

  def involving(user)
    self.users.find(user.id)
  end

  def room_name(user)
    name = ""
    self.users.each do |u|
      if u.id != user.id
        name << u.nickname
      end
    end
    name
    #self.title
  end

  def last_message
    if self.messages && self.messages.last
      self.messages.last.body.truncate_words(10)
    else
      "No messages"
    end
  end

end
