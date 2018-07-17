class Fuel

  TYPE = { 0 => 'petrol', 1 => 'diesel' }

  class << self

    def qualified_name(fuel)
      raise ArgumentError if !fuel.kind_of?(String)
      fuel.downcase!
      return fuel if fuel.in?(TYPE.values.first(2))
      raise ApiExceptions::BaseException.new('Invalid fuel type')
    end

    def valid?(fuel)
      raise ArgumentError if !fuel.kind_of?(String)
      return fuel.in?(TYPE.values)
    end

    def fetch_prices_by_fuel(fuel_type)
      Rails.cache.fetch("fuel_price_#{fuel_type}", expires_in: CommonUtils.cache_expiry) do
        IoclScraper.current_prices(fuel_type)
      end
    end
  end

end
