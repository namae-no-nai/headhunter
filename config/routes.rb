Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'applicants#show', as: :user_authenticated_root
  end
  devise_for :heads
  root 'home#index'

  resources :applicants, only: %i[index show new create edit update] 
end
