class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.json :image_url
      t.text :thumb, array: true, default: []
      t.text :pictures, array: true, default: []
      t.decimal :price, precision: 12, scale: 3
      t.boolean :active
      t.references :categories, foreign_key: true
      t.string :name
      t.text :description
    end
  end
end
