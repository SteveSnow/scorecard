Rails.application.routes.draw do
  get 'rounds/complete'
  get 'rounds/in_progress'

  post 'rounds/update_score'=>'rounds#update_score'
  get 'rounds/get_score'=>'rounds#get_score'
  get 'home/index'
  post '/test' => 'home#test'

  resources :rounds, only: [:show, :new, :create,:destroy]

  devise_for :members

root to: 'home#index'
end
