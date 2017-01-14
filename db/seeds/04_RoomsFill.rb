MessagesInRoomsCount.times do |n|
  user = User.all.sample

  m = Message.new
  m.body = Faker::Hacker.say_something_smart
  m.user_id = user.id
  m.room_id = Room.all.sample.id
  m.save

  m.room.users << user
end
