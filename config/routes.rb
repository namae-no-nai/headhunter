# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  authenticated :user do
    root 'applicants#show', as: :user_authenticated_root
  end
  devise_for :heads, controllers: {
    sessions: 'heads/sessions',
    registrations: 'heads/registrations'
  }
  authenticated :head do
    root 'head_profiles#index', as: :head_authenticated_root
  end
  root 'home#index'
  resources :applicants, only: %i[index show new create edit update] do
    resources :favorites, only: %i[create destroy]
    resources :posts, only: %i[show new create edit update destroy]
  end
  resources :feedbacks, only: [:index]
  resources :head_profiles, only: [:index]
  resources :job_offers, only: %i[index]
  resources :reply_offers, only: %i[index new create]
  resources :job_openings, only: [:index]
  resources :job_vacancies, only: %i[index show new create] do
    get 'search', on: :collection
    resources :feedbacks, only: %i[show new create]
    resources :job_offers, only: %i[new create]
    resources :job_openings, only: %i[show new create]
  end
end
