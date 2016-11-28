module ApplicationHelper
  def user_avatar(user, opts= {})
    opts[:alt] = user.fullname
    if user.image == nil then
      image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{opts.delete(:size) { 40 }}", opts
    else
      image_tag user.image, opts
    end
  end

  def current_user_name
    current_user.fullname
  end

  def current_user_id
    if user_signed_in? then
      current_user.id
    end
  end

end
