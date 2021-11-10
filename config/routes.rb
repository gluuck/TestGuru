# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true, 
               only: %i[create new edit show update destroy]
  end
end
