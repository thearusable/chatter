class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def after_sign_in_path_for(resource)
    root_path #edit_user_registration_path unless current_user.completed_profile?
  end

end
