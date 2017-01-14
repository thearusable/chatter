require 'rails_helper'

RSpec.describe PrivateRoomController, type: :controller do

  describe "GET #find_or_create" do
    it "returns http success" do
      get :find_or_create
      expect(response).to have_http_status(:success)
    end
  end

end
