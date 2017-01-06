require 'rails_helper'

describe "storedom endpoints" do
  context "GET /api/v1/items" do
    it "returns a list of all items" do
      item_1 = Item.create!(
        name: Faker::Commerce.product_name,
        description: Faker::Lorem.paragraph,
        image_url: "http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200"
        )

      item_2 = Item.create!(
        name: Faker::Commerce.product_name,
        description: Faker::Lorem.paragraph,
        image_url: "http://robohash.org/2.png?set=set2&bgset=bg1&size=200x200"
        )

      get "/api/v1/items"

      items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(items).to be_an(Array)
      expect(items.count).to eq(2)
      expect(items.first[:name]).to eq(item_1.name)
      expect(items.last[:name]).to eq(item_2.name)
    end
  end

  context "GET /api/v1/items/1" do
    it "returns a specific item" do
      item_1 = Item.create!(
        name: Faker::Commerce.product_name,
        description: Faker::Lorem.paragraph,
        image_url: "http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200"
        )

      item_2 = Item.create!(
        name: Faker::Commerce.product_name,
        description: Faker::Lorem.paragraph,
        image_url: "http://robohash.org/2.png?set=set2&bgset=bg1&size=200x200"
        )

      get "/api/v1/items/1"

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(item[:name]).to eq(item_1.name)
      expect(item[:description]).to eq(item_1.description)
    end
  end

  context "DELETE /api/v1/items/1" do
    it "deletes a specific item" do
      item_1 = Item.create!(
        name: Faker::Commerce.product_name,
        description: Faker::Lorem.paragraph,
        image_url: "http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200"
        )

      delete "/api/v1/items/1"

      expect(response).to be_success
      expect(Item.all).to eq([])
    end
  end

  context "POST /api/v1/items/1" do
    it "creates an item" do

      headers = { "CONTENT-TYPE" => "application/json" }
      params = {
        name: "item name",
        description: Faker::Lorem.paragraph,
        image_url: "http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200"
       }.to_json

      post "/api/v1/items", params, headers

      result = JSON.parse(response.body)

      expect(response).to be_success
      expect(Item.last.name).to eq("item name")
      expect(result['name']).to eq("item name")
      expect(result['image_url']).to eq("http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200")
    end
  end

end
