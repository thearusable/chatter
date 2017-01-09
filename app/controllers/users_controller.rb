class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page], per_page: 20).order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:success] = "Account updated."
      render 'edit'
    else
      flash[:success] = "Shit."
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:nickname, :email, :password,
                                   :password_confirmation, :age, :sex, :orientation, :avatar)
    end
end
