class CreateStockKeepingUnits < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :stock_keeping_units do |t|
      t.references :product, foreign_key: true
      t.integer :inventory_count
      t.string :product_type
      t.decimal :prices
      t.json :dimensions

      t.timestamps
    end
  end
end
