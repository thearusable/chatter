PrivateRoomsCount.times do
  p = Conversation.create!

  p.sender_id = User.all.sample.id
  p.recipient_id = User.all.sample.id

end
