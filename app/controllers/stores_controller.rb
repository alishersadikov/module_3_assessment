class StoresController < ApplicationController
  def show
    id = params["id"]
    response = Faraday.get("https://api.bestbuy.com/v1/stores(storeId=#{id})?format=json&show=hours,hoursAmPm,gmtOffset,detailedHours&apiKey=#{ENV['api_key']}")

    parsed = JSON.parse(response.body, symbolize_names: true)
    @hours = parsed[:stores].first[:hoursAmPm].split(";")
  end
end
