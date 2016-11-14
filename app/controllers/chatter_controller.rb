class ChatterController < ApplicationController
  helper_method :current_user
  before_action :authenticate_user!

  def index
    @user = current_user
  end

end
