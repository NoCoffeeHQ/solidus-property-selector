require 'rails_helper'

RSpec.describe "Spree::Admin::PropertyValues", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/spree/admin/property_values/index"
      expect(response).to have_http_status(:success)
    end
  end

end
