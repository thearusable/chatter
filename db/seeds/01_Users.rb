
UsersCount.times do |n|
    nick = Faker::Internet.user_name
    pass = Faker::Internet.password

    User.create!(
      email: nick + n.to_s + "@example.com",
      nickname: nick,
      age: rand(18..29),
      orientation: rand(0..2),
      sex: rand(0..1),
      password: pass,
      password_confirmation: pass,
      image: Faker::Avatar.image(nick, "40x40", "jpg")
    )

end
