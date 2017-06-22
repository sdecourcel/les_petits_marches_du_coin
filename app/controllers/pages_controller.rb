class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home

    # Market places
    @market_places = Location.market_places
    geojson_market_places = []
    @market_places.each { |item|
      geojson_market_places << {
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
      features: geojson_market_places
    }

    # Basket places
    @basket_places = Location.basket_places
    geojson_basket_places = []
    @basket_places.each { |item|
      geojson_basket_places << {
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
    @geojson_baskets = {
      type: "FeatureCollection",
      features: geojson_basket_places
    }

  end
end
