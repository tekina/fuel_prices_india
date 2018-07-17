class MainController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:fetch_fuel_price, :city_list]
  before_action :validate_city, :validate_fuel_type, only: [:price]


  def index
    render layout: 'application'
  end

  # GET /price
  def price
    city = params[:city]
    fuel_type = params[:fuel_type]
    price = City.price(city, fuel_type)
    response = { city: city }
    render json: response.merge!(price)
  end

  # GET /cities
  def city_list
    render json: { cities: City.city_list }
  end

  # GET /fuel_types
  def fuel_types
    render json: {fuel_types: Fuel::TYPE.values}
  end

  private

  def validate_fuel_type
    return true if params[:fuel_type].nil?
    return Fuel.valid?(Fuel.qualified_name(params[:fuel_type].to_s))
  end

  def validate_city
    return City.valid?(City.qualified_name(params[:city].to_s))
  end

end
