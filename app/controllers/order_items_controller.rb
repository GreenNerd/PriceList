class OrderItemsController < ApplicationController
  # before_action :set_order_item, only: [:create]
  protect_from_forgery except: :create

  def new
    @order_item = OrderItem.new
    @product = Product.find(session[:product_id])
    @skus = StockKeepingUnit.where(product_id: @product.id)
  end

  def create
    @order = current_order
    if params[:order_item][:stock_keeping_unit_id].present?
      sid = params[:order_item][:stock_keeping_unit_id]
      #if @order.order_items.find_by(stock_keeping_unit_id: sid).present?
      #  @order_item = @order.order_items.find_by(stock_keeping_unit_id: sid)
      #  newQua = @order_item[:quantity].to_i + params[:order_item][:quantity].to_i
      #  @order_item.update_attributes(:quantity, newQua)
      #  @order_items = @order.order_items
      #else
        @order_item = @order.order_items.new(order_item_params)
      #end
    elsif params[:order_item][:product_id].present?
      pid = params[:order_item][:product_id]
      quantity = params[:order_item][:quantity]
      @sku = StockKeepingUnit.find_by(product_id: pid)
      @order_item = @order.order_items
                          .new({:quantity => quantity,
                                :stock_keeping_unit_id => @sku.id})
    end
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

private
  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  def order_item_params
    params.require(:order_item).permit(:quantity, :stock_keeping_unit_id)
  end

end
