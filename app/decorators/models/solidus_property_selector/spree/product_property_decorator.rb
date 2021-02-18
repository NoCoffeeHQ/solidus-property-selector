# frozen_string_literal: true

module SolidusPropertySelector
  module Spree
    module ProductPropertyDecorator
      def self.prepended(base)
        base.class_eval do
          belongs_to :property_value, inverse_of: :product_properties, optional: true

          validates :property_value_id, presence: true, if: ->{ property.selector? }
          before_validation :set_default_value
        end
      end

      ::Spree::ProductProperty.prepend self

      private

      def set_default_value
        return unless property.selector?

        self.value = property_value.presentation
      end
    end
  end
end
