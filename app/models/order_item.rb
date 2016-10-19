class OrderItem < ApplicationRecord
  belongs_to :stock_keeping_unit
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :stock_keeping_unit_present
  validate :order_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      stock_keeping_unit.prices["VIP"].to_f
    end
  end

  def total_price
    unit_price * quantity
  end

private
  def stock_keeping_unit_present
    if stock_keeping_unit.nil?
      errors.add(:stock_keeping_unit, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    self[:unit_price] = unit_price.to_f
    self[:total_price] = quantity * self[:unit_price]
  end
end
