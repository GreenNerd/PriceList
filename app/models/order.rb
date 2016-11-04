class Order < ActiveRecord::Base
  has_many :order_items
  before_save :update_subtotal

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price.to_f) : 0 }.sum
  end

  def total
    order_items.count
  end

private
  def update_subtotal
    self[:subtotal] = subtotal
    self[:total] = total
  end
end
