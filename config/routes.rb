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
end
