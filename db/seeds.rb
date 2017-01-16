#how many
UsersCount = 50
PublicRoomsCount = 50
MessagesInPublicRoomsCount = 500

s3 = Aws::S3::Client.new
Male = s3.list_objects(bucket: ENV['S3_BUCKET_NAME'], prefix: 'seed/male/').contents
AllMaleSamples = Male.drop(1)
Female = s3.list_objects(bucket: ENV['S3_BUCKET_NAME'], prefix: 'seed/female/').contents
AllFemaleSamples = Female.drop(1)

 def image_male
  puts "https://s3-#{ENV['AWS_REGION']}.amazonaws.com/#{ENV['S3_BUCKET_NAME']}/#{AllMaleSamples.sample.key}"
   "https://s3-#{ENV['AWS_REGION']}.amazonaws.com/#{ENV['S3_BUCKET_NAME']}/#{AllMaleSamples.sample.key}"
 end

 def image_female
  puts "https://s3-#{ENV['AWS_REGION']}.amazonaws.com/#{ENV['S3_BUCKET_NAME']}/#{AllFemaleSamples.sample.key}"
   "https://s3-#{ENV['AWS_REGION']}.amazonaws.com/#{ENV['S3_BUCKET_NAME']}/#{AllFemaleSamples.sample.key}"
 end

#users
User.create!(email: "testowy@testowy.com", nickname: "Testowy User", password: "testowy", password_confirmation: "testowy")

UsersCount.times do |n|
    nick = Faker::Internet.user_name
    pass = Faker::Internet.password
    sex = rand(0..1)
    orient = if [true, false].sample then rand(0..2) else nil end
    age = if [true, false].sample then  rand(18..29) else nil end

    User.create!(
      email: nick + n.to_s + "@example.com",
      nickname: nick,
      age: age,
      orientation: orient,
      sex: sex,
      password: pass,
      password_confirmation: pass,
      avatar: if sex == 0 then image_male else image_female end
    )

end

#rooms
PublicRoomsCount.times do
  Room.create!(
    title: Faker::Name.title,
    category: Faker::Lorem.word,
    description: Faker::Lorem.paragraph
    )
end

#messages
MessagesInPublicRoomsCount.times do |n|

  room = Room.all.sample

  m = Message.new
  m.body = Faker::Hacker.say_something_smart
  m.messagable_id = room.id
  m.messagable_type = room.class.name

  m.user_id = User.all.sample.id

  User.find(m.user_id).join_to_room(m.messagable_id)

  m.save!
end
