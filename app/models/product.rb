class Product < ApplicationRecord
  has_many :stock_keeping_units, dependent: :destroy
  belongs_to :category

  paginates_per 12

  default_scope { where(active: true) }

  mount_uploaders :thumb, ImageUploader
end
