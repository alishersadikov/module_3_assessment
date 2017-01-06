class Store
  attr_reader :name, :city, :distance, :phone, :type, :id

  def initialize(store_data)
    @name = store_data[:longName]
    @city = store_data[:city]
    @distance = store_data[:distance]
    @phone = store_data[:phone]
    @type = store_data[:storeType]
    @id = store_data[:storeId]
  end

  def self.load_stores(parsed)
    parsed[:stores].map { |raw_store|  Store.new(raw_store) }.first(15)
  end

  def self.find_by_id(id)
    # binding.pry
  end
end
