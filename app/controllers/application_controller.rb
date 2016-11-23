class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def index
    @users = User.all
    user_name
  end

protected

  def user_name
      @user = current_user
      #@identyties = Identity.where(:id => @user.id)

      @name = @user.email
      #if @identyties.length then
      #  @name = @user.email
      #else
      #  @name = @identities.first.name
      #end
  end
end
