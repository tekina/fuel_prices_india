class MainController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:fetch_fuel_price, :city_list]

  def index
    render layout: 'application'
  end

  def fetch_fuel_price_with_msg
    city = params['city'].capitalize
    fuel_type = params['fuelType'].capitalize
    price = fetch_price(city, fuel_type)
    msg = price.to_i.zero? ? "Something went wrong. Please try again" : "Latest #{fuel_type} price for #{city} is Rs. #{price}."
    render json: { val: msg }
  end

  def fetch_fuel_price
    city = params['city'].capitalize
    fuel_type = params['fuelType'].capitalize
    price = fetch_price(city, fuel_type)
    render json: { city: city, price: price }
  end

  def city_list
  render json: { cities: City.city_list }
  end

  private
  
  def fetch_price(city, fuel_type)
    return City.fetch_price(city, fuel_type)
  end

end