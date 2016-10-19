class CartsController < ApplicationController
  def show
    @order = Order.find_by(id: 1)
    @order_items = @order.order_items
    @product = Product.find_by(id: 1)
    # @order_items = current_order.order_items
  end
end
