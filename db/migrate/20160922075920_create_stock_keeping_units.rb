class CreateStockKeepingUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_keeping_units do |t|
      t.integer :product_id
      t.integer :inventory_count
      t.string :product_type
      t.references :product, foreign_key: true
      t.hstore :prices
      t.hstore :dimensions

      t.timestamps
    end
  end
end
