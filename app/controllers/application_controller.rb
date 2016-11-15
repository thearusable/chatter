class ApplicationController < ActionController::Base
  helper_method :current_user, :signed_in?
  before_action :authenticate_user!
  protect_from_forgery


  def index
    @users = User.all
    user_name
  end

protected

  def user_name
      @user = current_user
      @identyties = Identity.where(:id => @user.id)

      @name
      if @identyties.length then
        @name = @user.email
      else
        @name = @identities.first.name
      end
  end

end
