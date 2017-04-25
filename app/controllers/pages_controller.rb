class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home

    # Market places
    @market_places = Location.market_places
    geojson_places = []
    @market_places.each { |item|
      geojson_places << {
        type: "Feature",
        geometry: {
          type: "Point",
          coordinates: [
            item.longitude,
            item.latitude
          ]
        }
      }
    }
    @geojson_markets = {
      type: "FeatureCollection",
      features: geojson_places
    }

  end
end
