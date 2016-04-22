Rails.application.routes.draw do

  get 'rounds/complete'
  get 'rounds/in_progress'
  get 'rounds/get_score'=>'rounds#get_score'
  get 'home/index'
  post '/test' => 'home#test'
  get 'rounds/changeview' => 'rounds#change_view'


  resources :rounds, only: [:show, :new, :create,:destroy] do
    resources :scores
  end

  resources :matches, only: [:show, :new, :create,:destroy,:update] do
    resources :invites, only: [:show, :new,:update, :create,:destroy]
   get 'update_leaderboard'
   post 'update_multiple_scores'
   get 'next_hole'
   get 'previous_hole'
   post 'set_current_hole'
  end

  devise_for :members

root to: 'home#index'
end
