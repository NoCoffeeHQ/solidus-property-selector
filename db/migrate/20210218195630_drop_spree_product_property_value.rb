class DropSpreeProductPropertyValue < ActiveRecord::Migration[6.1]
  def change
    drop_table :spree_product_property_values
  end
end
