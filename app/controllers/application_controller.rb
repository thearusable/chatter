class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  layout 'application'

  def after_sign_in_path_for(resource)
    if resource.nickname.nil? then resource.nick_from_email end
    root_path #edit_user_registration_path unless current_user.completed_profile?
  end

end
