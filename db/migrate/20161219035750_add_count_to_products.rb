class AddCountToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :count, :integer, default: 0
  end
end
