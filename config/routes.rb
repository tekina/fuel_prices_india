Rails.application.routes.draw do

  root to: 'main#index'

  namespace :main do
    get 'index'
    get 'city_list' # deprecated
  end

  get '/main/:city/:fuel_type/price' => 'main#price'  #deprecated

  get 'cities' => 'main#city_list'
  get 'fuel_types' => 'main#fuel_types'
  get 'price' => 'main#price'

end
