require 'rails_helper'

describe "storedom endpoints" do
  context "GET /api/v1/items" do
    it "returns a list of all destinations" do
      
      get "/api/v1/items"

      items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(destinations.count).to eq(2)
      expect(destinations.first[:name]).to eq(destination_1.name)
      expect(destinations.last[:name]).to eq(destination_2.name)
    end
  end
end
