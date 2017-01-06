class StoresController < ApplicationController
  def show
    id = params["id"]
    @hours = BestbuyService.new.get_hours(id)
  end
end
