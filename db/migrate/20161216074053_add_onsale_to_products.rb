class AddOnsaleToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :onsale, :boolean
  end
end
