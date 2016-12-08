class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.json :image_url
      t.decimal :price, precision: 12, scale: 3
      t.boolean :active
      t.references :categories, foreign_key: true
      t.string :name
      t.json :thumb,    array: true
      t.json :pictures, array: true
      t.text :description
    end
  end
end
