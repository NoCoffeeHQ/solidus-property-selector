class AddPropertyValueReferenceToSpreeProductProperty < ActiveRecord::Migration[6.1]
  def change
    add_reference :spree_product_properties, :property_value, index: true
  end
end
