class CreateDimensions < ActiveRecord::Migration[5.0]
  def change
    create_table :dimensions do |t|
      t.text :key
      t.text :val
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
