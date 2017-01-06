class BestbuyService
  attr_reader :store_count, :stores, :zipcode, :conn

  def initialize(zipcode = nil)
    @zipcode = zipcode
    @store_count = ""
    @stores = []
    @conn = connection
  end

  def fetch_stores
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zipcode},25))?format=json&show=longName,city,distance,phone,storeType,storeId&apiKey=#{ENV['api_key']}&pageSize=25")
    parsed = JSON.parse(response.body, symbolize_names: true)
    @store_count = parsed[:total]
    @stores = Store.load_stores(parsed)
  end

  def get_hours(id)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(storeId=#{id})?format=json&show=hours,hoursAmPm,gmtOffset,detailedHours&apiKey=#{ENV['api_key']}")
    parsed = JSON.parse(response.body, symbolize_names: true)
    parsed[:stores].first[:hoursAmPm].split(";")
  end


  private
    def connection
     Faraday.new(url: "https://api.bestbuy.com/v1/stores") do |faraday|
       faraday.adapter Faraday.default_adapter
     end
    end
end
