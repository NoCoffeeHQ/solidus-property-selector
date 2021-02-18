# frozen_string_literal: true

module Spree
  module Api
    class PropertyValuesController < Spree::Api::BaseController
      before_action :find_property, only: :index

      def index
        @property_values = @property.property_values #.accessible_by(current_ability)
      end

      private

      def find_property
        @property = Spree::Property.accessible_by(current_ability, :show).find(params[:property_id])
      rescue ActiveRecord::RecordNotFound
        @property = Spree::Property.accessible_by(current_ability, :show).find_by!(name: params[:property_id])
      end
    end
  end
end
