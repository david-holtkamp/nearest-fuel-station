class FuelStationService

  def initialize(search_params)
    @location = search_params
  end

  def fuel_station
    get_json[:fuel_stations]

  end

  private

    def get_json
      response = conn.get
      json_response = JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: 'https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json') do |faraday|
        faraday.params['location'] = @location
        faraday.params['limit'] = 1
        faraday.params['api_key'] = ENV['NREL_KEY']
        faraday.adapter Faraday.default_adapter
      end
    end
end
