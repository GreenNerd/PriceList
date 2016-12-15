class AddSupportToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :title, :string
    add_column :categories, :content, :text
    add_column :categories, :secret_field, :text
  end
end
