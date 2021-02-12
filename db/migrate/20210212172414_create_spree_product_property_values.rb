class CreateSpreeProductPropertyValues < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_product_property_values do |t|
      t.references :product, index: true, null: false
      t.references :property_value, index: true, null: false
      t.timestamps
    end
  end
end
