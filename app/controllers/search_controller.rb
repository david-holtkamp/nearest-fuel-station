class SearchController < ApplicationController

  def index
    render locals: {
    search_results: FuelStationSearch.new(search_params)
    
  }
  end

  private

    def search_params
      params.permit(:location)
    end
end
