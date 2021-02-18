# frozen_string_literal: true

module Spree
  module Api
    module ApiHelpersDecorator
      def self.prepended(_)
        @@property_attributes = [:id, :name, :presentation, :value_type]
        @@property_value_attributes = [:id, :name, :presentation]
      end

      ::Spree::Api::ApiHelpers.prepend self
    end
  end
end
