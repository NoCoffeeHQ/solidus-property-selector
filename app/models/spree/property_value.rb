# frozen_string_literal: true

module Spree
  class PropertyValue < ApplicationRecord
    acts_as_list scope: :property

    belongs_to :property, class_name: 'Spree::Property',
                          inverse_of: :property_values, optional: true
    has_many :product_properties, inverse_of: :property_value, dependent: :destroy
  end
end
