class OrderItemsController < ApplicationController
  # before_action :set_order_item, only: [:create]
  protect_from_forgery except: :create

  def new
    @order_item = OrderItem.new
    @product = Product.find(session[:product_id])
    @skus = StockKeepingUnit.where(product_id: @product.id)
  end

  def oiedit
    @order = current_order
    if params[:Coid].present? && params[:Csel].present? && params["Cqua"].present?
      @order_item = @order.order_items.find_by(id: params[:Coid])
      old_sid = @order_item.stock_keeping_unit_id
      pid = StockKeepingUnit.find_by(id: old_sid).product_id
      old_type = StockKeepingUnit.find_by(id: old_sid).product_type
      @order_item.update_attribute(:quantity, params[:Cqua])
      if old_type != params[:Csel]
        StockKeepingUnit.where("product_id = ?", pid)
        new_sid = StockKeepingUnit.where("product_id = ? AND product_type = ?", pid, params[:Csel]).first.id
        @order_item.update_attribute(:stock_keeping_unit_id, new_sid)

        # merge the same order item
        sameOi = @order.order_items.where("stock_keeping_unit_id = ?", new_sid)
        if sameOi.count > 1
          mergedQua = sameOi.collect{ |oi| oi.quantity }.sum
          sameOi.each do |oi|
            if oi == sameOi.first
              oi.update_attribute(:quantity, mergedQua)
            else
              oi.destroy
            end
          end
        end
      end
    end
    respond_to do |format|
      format.js
    end
  end

  def create
    @order = current_order
    if params[:order_item][:stock_keeping_unit_id].present?
      sid = params[:order_item][:stock_keeping_unit_id]
      if @order.order_items.find_by(stock_keeping_unit_id: sid).present?
        @order_item = @order.order_items.find_by(stock_keeping_unit_id: sid)
        newQua = @order_item[:quantity].to_i + params[:order_item][:quantity].to_i
        @order_item.update_attribute(:quantity, newQua)
        @order_items = @order.order_items
      else
        @order_item = @order.order_items.new(order_item_params)
      end
    elsif params[:order_item][:product_id].present?
      pid = params[:order_item][:product_id]
      quantity = params[:order_item][:quantity]
      @sku = StockKeepingUnit.find_by(product_id: pid)
      if @order.order_items.find_by(stock_keeping_unit_id: @sku.id).present?
        @order_item = @order.order_items.find_by(stock_keeping_unit_id: @sku.id)
        newQua = @order_item[:quantity].to_i + params[:order_item][:quantity].to_i
        @order_item.update_attribute(:quantity, newQua)
        @order_items = @order.order_items
      else
        @order_item = @order.order_items
                            .new({:quantity => quantity,
                                  :stock_keeping_unit_id => @sku.id})
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
