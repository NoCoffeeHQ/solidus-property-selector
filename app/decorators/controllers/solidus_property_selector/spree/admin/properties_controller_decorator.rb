# frozen_string_literal: true

module SolidusPropertySelector
  module Spree
    module Admin
      module PropertiesControllerDecorator
        def self.prepended(base)
          base.class_eval do
            before_action :setup_new_property_value, only: :edit
          end
        end

        def update_values_positions
        params[:positions].each do |id, index|
          ::Spree::PropertyValue.where(id: id).update_all(position: index)
        end

        respond_to do |format|
          format.js { head :no_content }
        end
      end

        private

        def setup_new_property_value
          return unless @property.property_values.empty? && @property.selector?

          @property.property_values.build
        end

        ::Spree::Admin::PropertiesController.prepend self
      end
    end
  end
end
