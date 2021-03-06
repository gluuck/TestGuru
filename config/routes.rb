# frozen_string_literal: true

Rails.application.routes.draw do

  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: {sign_in: :log_in, sign_out: :logout},
              controllers: { sessions: 'sessions' }

  resources :users do
    resources :feedbacks, only: %i[new create]
  end
  
  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :results, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :gists, only: :create

  resources :badges, only: :index

  namespace :admin do
    resources :badges
    resources :gists, shallow: true, only: :index
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow:true, except: :index
      end
    end
  end
end
