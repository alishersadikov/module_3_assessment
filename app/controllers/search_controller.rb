class SearchController < ApplicationController
  def index
    @zipcode = params["zipcode"]
    parsed = BestbuyService.new.fetch_stores(@zipcode)
    # response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{@zipcode},25))?format=json&show=longName,city,distance,phone,storeType,storeId&apiKey=445jt4mb4gsenju48n2ndu8d&pageSize=25")
    # parsed = JSON.parse(response.body, symbolize_names: true)
    # @store_count = parsed[:total]
    # @stores = Store.load_stores(parsed)
    @store_count = parsed.store_count
    @stores = parsed.stores
  end
end
