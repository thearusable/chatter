
child @users => :peoples do
  collection @users, object_root: false
  attributes :nickname => :name
  @users.each do |user|
    node(:desc) { user_info(user)}
    node(:id) {user.id}
  end
end

child @rooms => :rooms do
  collection @rooms, object_root: false
  attributes :title => :name, :body => :desc, :id => :id
  @rooms.each do |room|
    node(:url) { room_path(room) }
    node(:desc) { room.category }
  end
end
