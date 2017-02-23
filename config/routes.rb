Rails.application.routes.draw do

  root to: 'main#index'

  namespace :main do
    get 'index'
    get 'blah'
    post 'fetch_fuel_price'
    post 'fetch_fuel_price_with_msg'
  end


end
