PrivateRoomsCount.times do
  p = PrivateRoom.create!

  2.times do
    p.users << User.all.sample
  end

end
