class City

  def self.city_code(city_name)
    City.list[:cities][city_name]
  end

  def self.city_list
    City.list[:cities].keys
  end

  def self.fetch_price(city_name, fuel_type)
    code = city_code(city_name)
    return nil if code.nil?
    Rails.cache.fetch("fuel_price_#{code}_#{fuel_type}", expires_in: 2.days) do
      FuelPriceScraper.get_fuel_price(city_name, code, fuel_type)
    end
  end

  private
  
  class << self
    def list
      {cities: {
        "Bengaluru" => 6,
        "Pune" => 7,
        "Delhi" => 2,
        "Mumbai" => 3,
        "Chennai" => 5,
        "Hyderabad" => 8,
        "Chandigarh" => 15,
        "Kolkata" => 4,
        "Ahmedabad" => 10,
        "Coimbatore" => 509,
        "Indore" => 46,
        "Jaipur" => 21,
        "Ludhiana" => 73,
        "Mangaluru" => 384,
        "Mysore" => 49,
        "Vizag" => 134,
        "Goa" => 272,
        "Nagpur" => 76,
        "Trivandrum" => 35,
        "Udaipur" => 225,
        "Guntur" => 85,
        "Surat" => 51,
        "Kolkata" => 4,
        "Bhopal" => 13,
        "Lucknow" => 25,
        "Guwahati" => 18,
        "Trivandrum" => 35
        }
      }
    end
  end

end