class City

  def self.city_list
    City.list[:cities].keys
  end

  def self.price(city, fuel)
    response = {}
    if fuel.nil?
      response = fetch_all_prices(qualified_name(city))
    else
      response[fuel] = fetch_price(qualified_name(city), Fuel.qualified_name(fuel))
    end
    return response
  end

  def self.fetch_all_prices(city)
    response = {}
    Fuel::TYPE.values.each do |type|
      response[type] = fetch_price(city, type)
    end
    return response
  end

  def self.fetch_price(city_name, fuel_type)
    code = city_code(city_name)
    raise ApiExceptions::BaseException.new('Data not available for this city') if code.nil?
    Rails.cache.fetch("fuel_price_#{code}_#{fuel_type}", expires_in: 1.day) do
      FuelPriceScraper.get_fuel_price(city_name, code, fuel_type)
    end
  end

  def self.qualified_name(city)
    raise ArgumentError if !city.kind_of?(String)
    return city.capitalize if city.capitalize.in?(list[:cities].keys)
    raise ApiExceptions::BaseException.new('Data not available for this city')
  end

  def self.valid?(city)
    raise ArgumentError if !city.kind_of?(String)
    return city.in?(list[:cities].keys)
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

    def city_code(city_name)
      City.list[:cities][city_name]
    end

  end

end
