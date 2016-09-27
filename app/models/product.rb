class Product < ApplicationRecord
  has_many :order_items
  has_many :stock_keeping_units, dependent: :destroy
  belongs_to :category

  default_scope { where(active: true) }
end
