require 'carrierwave/orm/activerecord'

class Product < ApplicationRecord
  has_many :stock_keeping_units, dependent: :destroy
  accepts_nested_attributes_for :stock_keeping_units, allow_destroy: true
  has_many :dimensions, dependent: :destroy
  accepts_nested_attributes_for :dimensions, allow_destroy: true

  belongs_to :category

  paginates_per 12

  default_scope { where(active: true) }

  mount_uploaders :thumb, ImageUploader
  mount_uploaders :pictures, ImageUploader
  mount_uploaders :image_url, ImageUploader
end
