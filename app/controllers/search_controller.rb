class SearchController < ApplicationController

  def autocomplete
    @users = User.order(:nickname).where('nickname LIKE ?', "%#{params[:query]}%")
    @rooms = PublicRoom.order(:title).where('title LIKE ?', "%#{params[:query]}%")
  end

end
