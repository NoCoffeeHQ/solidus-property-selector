class CreateSpreePropertyValues < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_property_values do |t|
      t.string :name
      t.string :presentation
      t.integer :position, limit: 4
      t.references :property

      t.timestamps
    end
  end
end
