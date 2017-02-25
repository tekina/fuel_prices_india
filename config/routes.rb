Rails.application.routes.draw do

  root to: 'main#index'

  namespace :main do
    get 'index'
    get 'city_list'
  end

  get '/main/:city/:fuel_type/price' => 'main#price'

end
