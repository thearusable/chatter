
PublicRoomsCount.times do
  PublicRoom.create!(
    title: Faker::Name.title,
    category: Faker::Lorem.word,
    description: Faker::Lorem.paragraph,
    owner_id: User.all.sample.id
    )
end
