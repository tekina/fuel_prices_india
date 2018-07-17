Rails.application.routes.draw do

  root to: 'main#index'

  get 'cities' => 'main#city_list'
  get 'fuel_types' => 'main#fuel_types'
  get 'price' => 'main#price'

end
