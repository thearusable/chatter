
PublicRoomsCount.times do
  Room.create!(
    title: Faker::Name.title,
    category: Faker::Lorem.word,
    description: Faker::Lorem.paragraph
    )
end
