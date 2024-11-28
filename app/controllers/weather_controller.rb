class WeatherController < ApplicationController
    def index
        api_key = '884b65e5c1facd0cf9ce41c955079dd3'
        api = WeatherApi.new(api_key)
        @weather = api.weather_by_zipcode('30318')
      end

    def search
      api_key = '884b65e5c1facd0cf9ce41c955079dd3'
      api = WeatherApi.new(api_key)
      @address = weather_params
      @zipcode = WeatherHelper.get_postal_code(weather_params).to_s.strip
      @weather = api.weather_by_zipcode(@zipcode)
      puts weather_params 
      render "show"
    end

    private

    def weather_params
      params.require(:address)
    end
end
