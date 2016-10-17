class ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page])
    if params[:search]
      @products = Product.find_by(name: params[:search])
    else
      #
    end
    @order_item = current_order.order_items.new
  end

  def show
    set_cartinfo
  end

  def addtocart
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    respond_to do |format|
      if @order.save
        flash.now[:notice]="add to cart success"
      else
        flash.now[:notice]="add to cart fail"
      end
    end
  end

private
  def set_cartinfo
    @product = Product.find(params[:id])
    @skus = StockKeepingUnit.where(product_id: params[:id])
  end

  def order_item_params
    params.require(:order_item).permit(:quntity, :stock_keeping_unit_id)
  end

end
