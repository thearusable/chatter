module ApplicationHelper

  def user_info(user)
    info = ""
    if user.age then info += "age: " + user.age.to_s + " " end
    if user.sex then info += "sex: " + user.sex.to_s + " " end
    if user.orientation then info += "orietation: " + user.orientation.to_s + " " end

    info
  end
end
