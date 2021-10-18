require 'rails_helper'

RSpec.describe "Slots", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/slots/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/slots/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/slots/create"
      expect(response).to have_http_status(:success)
    end
  end

end
