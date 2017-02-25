class MainController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:fetch_fuel_price, :city_list]

  def index
    render layout: 'application'
  end

  def price
    city = params['city'].capitalize
    fuel_type = params['fuel_type'].capitalize
    price = City.fetch_price(city, fuel_type)
    render json: { city: city, price: price }
  end

  def city_list
  render json: { cities: City.city_list }
  end

end