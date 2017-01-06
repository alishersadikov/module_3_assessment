class SearchController < ApplicationController
  def index
    zipcode = params["zipcode"]
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zipcode},25))?format=json&show=longName,city,distance,phone,storeType&apiKey=445jt4mb4gsenju48n2ndu8d&pageSize=25")
    parsed = JSON.parse(response.body, symbolize_names: true)

    Store.load_stores(parsed)
  end
end

class Store
  def initialize(store_data)
    name = store_data[:longName]
    city = store_data[:city]
    distance = store_data[:distance]
    phone = store_data[:phone]
    type = store_data[:storeType]
  end

  def self.load_stores(parsed)
    parsed[:stores].map { |raw_store|  Store.new(raw_store) }
  end
end
