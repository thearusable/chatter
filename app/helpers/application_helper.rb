module ApplicationHelper

  def user_info(user)
    info = ""
    if user.age then info += "age: " + user.age.to_s + " " end
    if user.sex then info += "sex: " + user.sex.to_s + " " end
    if user.orientation then info += "orietation: " + user.orientation.to_s + " " end

    info
  end

  def user_avatar(user, size)
    if user.avatar.exists? then
      user.avatar.url(size)
    else
      user.avatar = nil
      user.save

      user.avatar.url(size)
    end
  end

end
