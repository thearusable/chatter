
MessagesInRoomsCount.times do |n|
  m = Message.new
  m.body = Faker::Hacker.say_something_smart
  m.user_id = rand(1..UsersCount)
  m.room_id = rand(1..13)
  m.save
end
