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
      value = Rails.cache.read(@zipcode)
      @weather
      @cached_value
      if !value
        @weather = api.weather_by_zipcode(@zipcode)
        Rails.cache.write(@zipcode, @weather)
        @cached_value = false
      else
        @cached_value = true
        @weather = JSON.parse(value.body)
      end
      render "show"
    end

    private

    def weather_params
      params.require(:address)
    end
end
