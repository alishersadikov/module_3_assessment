class SearchController < ApplicationController
  def index
    zipcode = params["zipcode"]
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zipcode},25))?format=json&show=storeId,storeType,name,city,region&apiKey=445jt4mb4gsenju48n2ndu8d&pageSize=25")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end
