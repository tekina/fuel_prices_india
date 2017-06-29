class City

  class << self

    def city_list
      list
    end

    def price(city, fuel)
      response = {}
      if fuel.nil?
        response = fetch_all_prices(qualified_name(city))
      else
        response[fuel] = fetch_price(qualified_name(city), Fuel.qualified_name(fuel))
      end
      return response
    end

    def fetch_all_prices(city)
      response = {}
      Fuel::TYPE.values.each do |type|
        response[type] = fetch_price(city, type)
      end
      return response
    end

    def fetch_price(city_name, fuel_type)
      raise ApiExceptions::BaseException.new('Data not available for this city') if !valid?(city_name)
      prices = Fuel.fetch_prices_by_fuel(fuel_type)
      return prices[city_name]
    end

    def qualified_name(city)
      raise ArgumentError if !city.kind_of?(String)
      city = city.titleize
      return city if city.in?(list)
      raise ApiExceptions::BaseException.new('Data not available for this city')
    end

    def valid?(city)
      raise ArgumentError if !city.kind_of?(String)
      return city.in?(list)
    end

  end

  private

  class << self

    def list
      ["New Delhi", "Kolkata", "Mumbai", "Chennai", "Faridabad", "Gurgaon", "Noida", "Ghaziabad", "Agartala", "Aizwal", "Ambala", "Bangalore", "Bhopal", "Bhubhaneswar", "Chandigarh", "Dehradun", "Gandhinagar", "Gangtok", "Guwahati", "Hyderabad", "Imphal", "Itanagar", "Jaipur", "Jammu", "Jullunder", "Kohima", "Lucknow", "Panjim", "Patna", "Pondichery", "Port Blair", "Raipur", "Ranchi", "Shillong", "Shimla", "Srinagar", "Trivandrum", "Silvasa", "Daman"]
    end

  end

end
