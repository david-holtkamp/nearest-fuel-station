class FuelDirectionsService

  def initialize(search_params)
    @starting_location = search_params
  end

  def directions
    get_json[:steps]
  end

  private

    def get_json
      response = conn.get
      json_response = JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: 'https://maps.googleapis.com/maps/api/directions/json?') do |faraday|
        faraday.params['origin'] = @starting_location
        faraday.params['destination'] =
        faraday.params['key'] = ENV['GOOGLE_MAPS_KEY']
        faraday.adapter Faraday.default_adapter
      end
    end
end
