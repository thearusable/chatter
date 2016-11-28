
UsersCount.times do |n|
    nick = Faker::Internet.user_name
    pass = Faker::Internet.password

    User.create!(
      email: nick + n.to_s + "@example.com",
      fullname: Faker::Name.name,
      nickname: nick,
      phone: Faker::PhoneNumber.cell_phone,
      password: pass,
      password_confirmation: pass,
      image: Faker::Avatar.image(nick, "40x40", "jpg")
    )

end
