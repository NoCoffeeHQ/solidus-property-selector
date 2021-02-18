# frozen_string_literal: true

Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :property_values
    resource :properties, only: [] do
      collection do
        post :update_values_positions
      end
    end
  end

  namespace :api, default: { format: 'json' } do
    resources :properties, only: [] do
      resources :property_values, only: :index
    end
  end
end
