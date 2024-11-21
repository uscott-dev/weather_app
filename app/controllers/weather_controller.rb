class WeatherController < ApplicationController
    def index
        api_key = '884b65e5c1facd0cf9ce41c955079dd3'
        api = WeatherApi.new(api_key)
        @weather = api.weather_by_zipcode('30318')
      end
end
