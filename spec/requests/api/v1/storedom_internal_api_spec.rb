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
end
