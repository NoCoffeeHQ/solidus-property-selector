# frozen_string_literal: true

module SolidusPropertySelector
  module Spree
    module Api
      module ApiHelpersDecorator
        def self.prepended(base)
          base.module_eval do
            @@property_attributes = [:id, :name, :presentation, :value_type]
            @@property_value_attributes = [:id, :name, :presentation]
          end
        end

        ::Spree::Api::ApiHelpers.prepend self
      end
    end
  end
end
