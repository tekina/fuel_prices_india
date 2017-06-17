class Fuel

  TYPE = { 0 => 'Petrol', 1 => 'Diesel', 2 => 'CNG' }

  def self.qualified_name(fuel)
    raise ArgumentError if !fuel.kind_of?(String)
    return fuel.capitalize if fuel.capitalize.in?(TYPE.values.first(2))
    return fuel.upcase if fuel.upcase == TYPE[2]
    raise ApiExceptions::BaseException.new('Invalid fuel type')
  end

  def self.valid?(fuel)
    raise ArgumentError if !fuel.kind_of?(String)
    return fuel.in?(TYPE.values)
  end

end
