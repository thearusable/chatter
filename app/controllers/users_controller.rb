class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def update
    @user = current_user
  end
end
