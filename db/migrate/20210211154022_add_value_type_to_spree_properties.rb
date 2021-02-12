class AddValueTypeToSpreeProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_properties, :value_type, :integer, default: 0, null: false
  end
end
