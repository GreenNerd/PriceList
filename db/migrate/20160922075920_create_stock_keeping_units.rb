class CreateStockKeepingUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_keeping_units do |t|
      t.references :product, foreign_key: true
      t.integer :inventory_count
      t.string :product_type
      t.hstore :prices
      t.hstore :dimensions

      t.timestamps
    end
  end
end
