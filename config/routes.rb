Rails.application.routes.draw do

  root to: 'main#index'

  namespace :main do
    get 'index'
    get 'city_list'
    post 'fetch_fuel_price'
    post 'fetch_fuel_price_with_msg'
  end


end
