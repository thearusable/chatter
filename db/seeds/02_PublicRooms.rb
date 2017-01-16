PublicRoomsCount.times do
  Room.create!(
    title: Faker::Name.title,
    category: Faker::Lorem.word,
    description: Faker::Lorem.paragraph
    )
end

MessagesInPublicRoomsCount.times do |n|
  user = User.all.sample
  room = Room.all.sample

  m = Message.new
  m.body = Faker::Hacker.say_something_smart
  m.user_id = user.id
  m.messagable_id = room.id
  m.messagable_type = room.class.name

  founded = false
  user.rooms.each do |r|
    if (room.id == r.id)
      founded = true
      break;
    end
  end
  if founded == false
      user.rooms << room
  end

  m.save!
end
