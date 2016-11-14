class ChatterController < ApplicationController
  helper_method :current_user, :signed_in?
  before_action :authenticate_user!

  def index
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
