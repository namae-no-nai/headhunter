Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'applicants#show', as: :user_authenticated_root
  end
  devise_for :heads
  authenticated :head do
    root 'head_profiles#index', as: :head_authenticated_root
  end
  root 'home#index'
  resources :head_profiles, only: [:index]
  resources :applicants, only: %i[index show new create edit update] 
  resources :job_vacancies, only: %i[index show new create] do
    get 'search', on: :collection
  end
end
