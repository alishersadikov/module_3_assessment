class SearchController < ApplicationController
  def index
    zipcode = params["zipcode"]
    binding.pry
    request = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zipcode}, 25))?format=json&show=storeId,storeType,name,city,region&apiKey=#{ENV['api_key']}&pageSize=25")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end
