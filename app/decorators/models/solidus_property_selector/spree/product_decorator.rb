# frozen_string_literal: true

module SolidusPropertySelector
  module Spree
    module ProductDecorator
      def self.prepended(base)
        base.class_eval do
          has_many :product_property_values
          has_many :product_values, through: :product_property_values
        end
      end

      ::Spree::Product.prepend self
    end
  end
end
