class SearchController < ApplicationController

  def autocomplete
    @users = User.order(:nickname).where('lower(nickname) LIKE ?', "%#{params[:query].downcase}%")
    @rooms = Room.order(:title).where('lower(title) LIKE ?', "%#{params[:query].downcase}%")
  end

end
