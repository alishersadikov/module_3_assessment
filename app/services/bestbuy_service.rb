class BestbuyService
  attr_reader :store_count, :stores
  def initialize
    @store_count = ""
    @stores = []
  end

  def fetch_stores(zipcode)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zipcode},25))?format=json&show=longName,city,distance,phone,storeType,storeId&apiKey=#{ENV['api_key']}&pageSize=25")
    parsed = JSON.parse(response.body, symbolize_names: true)
    @store_count = parsed[:total]
    @stores = Store.load_stores(parsed)
  end

end
