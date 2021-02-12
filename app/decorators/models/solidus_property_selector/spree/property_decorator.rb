# frozen_string_literal: true

module SolidusPropertySelector
  module Spree
    module PropertyDecorator
      def self.prepended(base)
        base.class_eval do
          include TranslateEnum

          enum value_type: { text: 0, selector: 1 }
          translate_enum :value_type

          has_many :property_values, -> { order(:position) }, dependent: :destroy,
                                                              inverse_of: :property
          accepts_nested_attributes_for :property_values,
            allow_destroy: true,
            reject_if: lambda { |pv| pv[:name].blank? && pv[:presentation].blank? }
        end
      end

      ::Spree::Property.prepend self
    end
  end
end
