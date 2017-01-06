class SearchController < ApplicationController
  def index
    @zipcode = params["zipcode"]
    service = BestbuyService.new(@zipcode)
    @stores = service.fetch_stores
    @store_count = service.store_count
  end
end
