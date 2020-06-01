Rails.application.routes.draw do
  devise_for :users
  devise_for :heads
  
  root 'home#index'
end
