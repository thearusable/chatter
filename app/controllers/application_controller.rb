class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_filter :load_history

  layout 'application'

  def after_sign_in_path_for(resource)
    if resource.nickname.nil? then resource.nick_from_email end
    root_path
  end

  def load_history
    if current_user
      history = current_user.conversations + current_user.rooms
      $history = (history.sort_by &:updated_at).reverse
    end
  end

end
