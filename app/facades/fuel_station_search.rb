class FuelStationSearch

  def initialize(search_params)
    @service = FuelStationService.new(search_params[:location])
    @direction_service = FuelDirectionsService.new(search_params[:location])
  end

  def get_fuel_station
    @service.fuel_station.map do |station_data|
      FuelStation.new(station_data)
    end
  end

  def fuel_station_address
    fuel_station = get_fuel_station
    fuel_station.full_address
  end

  def get_station_directions

  end
end
