require 'carrierwave/orm/activerecord'

class Product < ApplicationRecord
  has_many :stock_keeping_units, dependent: :destroy
  accepts_nested_attributes_for :stock_keeping_units, allow_destroy: true
  has_many :dimensions, dependent: :destroy
  accepts_nested_attributes_for :dimensions, allow_destroy: true

  belongs_to :category

  paginates_per 12

  default_scope { where(active: true) }

  validates :name, presence: true
  validates :thumb, presence: true
  validates :description, presence: true
  validates :stock_keeping_units, presence: true
end
