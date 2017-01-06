class Store
  attr_reader :name, :city, :distance, :phone, :type

  def initialize(store_data)
    @name = store_data[:longName]
    @city = store_data[:city]
    @distance = store_data[:distance]
    @phone = store_data[:phone]
    @type = store_data[:storeType]
  end

  def self.load_stores(parsed)
    parsed[:stores].map { |raw_store|  Store.new(raw_store) }.first(15)
  end
end
