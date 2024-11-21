require 'httparty'
class WeatherApi
  include HTTParty
  base_uri 'https://api.openweathermap.org/data/2.5'
  def initialize(api_key)
    @options = { query: { appid: api_key } }
  end
  def weather_by_zipcode(zipcode)
    self.class.get("/weather?zip=#{zipcode}", @options)
  end
end
