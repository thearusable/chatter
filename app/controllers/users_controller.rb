class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page], per_page: 20).order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @user = current_user
  end
end
