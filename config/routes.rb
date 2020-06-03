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
  resources :applicants, only: %i[index show new create edit update] do
    resources :posts, only: %i[show new create edit update destroy]
  end
  resources :job_openings, only: [:index]
  resources :job_vacancies, only: %i[index show new create] do
    get 'search', on: :collection
    resources :job_openings, only: %i[show new create]
  end
end
