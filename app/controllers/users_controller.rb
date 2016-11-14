class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @identyties = Identity.where(:id => @user.id)

    @name
    if @identyties.length then
      @name = @user.email
    else
      @name = @identities.first.name
    end
    #profile
  end

end
