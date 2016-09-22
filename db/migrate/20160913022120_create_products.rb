class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :image_url
      t.decimal :price, precision: 12, scale: 3
      t.boolean :active
      
      t.string :name
      t.string :thumb,    array: true
      t.string :pictures, array: true
      t.string :description
      t.string :category, array: true
    end
  end
end
