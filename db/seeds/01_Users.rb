
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
