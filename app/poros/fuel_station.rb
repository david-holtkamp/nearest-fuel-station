class FuelStation
  attr_reader :name, :address, :fuel_type, :access_times

  def initialize(attributes = {})
    @name = attributes[:station_name]
    @street_address = attributes[:street_address]
    @city = attributes[:city]
    @state = attributes[:state]
    @zip = attributes[:zip]
    @fuel_type = attributes[:fuel_type_code]
    @access_times = attributes[:access_days_time]
  end

  def full_address
    "#{@street_address} + #{@city} + #{@state} + #{@zip}"
  end
end
