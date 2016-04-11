Rails.application.routes.draw do
  get 'home/index'

  devise_for :members

root to: 'home#index'
end
