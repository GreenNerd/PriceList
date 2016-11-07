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
    @product = Product.find(session[:product_id])
    @sku = StockKeepingUnit.find_by(product_type: params[:product_type])
    @order_item = @order.order_items.new
    @order_item.stock_keeping_unit_id = @sku.id
    @order_item.quantity = params[:quantity]
    @order_item.order_id = @order.id.to_i
    @order_item.unit_price = @sku.prices["VIP"].to_f
    if @order.save
      respond_to do |format|
        format.js { render status: 200 }
      end
    else
      p "failed"
    end
    session[:order_id] = @order.id

  end

  def test
    @current_product = Product.find(session[:product_id])
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    # @product_id = @order_item.product_id
    # byebug
    # if !OrderItem.find_by(product_id: @product_id).nil?
    #  @order_item.destroy
    #  @order_item = OrderItem.find_by(product_id: @product_id)
    #  @order_item.update_attributes(order_item_params)
    #  @order_items = @order.order_items
    # else
    #  @order.save
    # end
    respond_to do |format|
      if @order.save
        flash.now[:notice]="加入购物车成功"
        format.json { head :no_content }
        format.js
      else
        flash.now[:notice]="加入购物车失败"
        format.json { render json: @order_item.errors.full_messages,
                            status: :unprocessable_entity }
      end

    end

    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
    if params[:Uquantity].present?
      newQua = params[:Uquantity]
      @order_item.update_attribute(quantity, newQua)
    end
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
