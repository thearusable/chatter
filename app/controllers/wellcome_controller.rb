class WellcomeController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  layout "magister"

  def index
  end
end
