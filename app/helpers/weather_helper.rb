module WeatherHelper
    def self.get_postal_code(s)
        r = /\s+\d{5}(-\d{4})?\b/
        return r.match(s)
    end
end
