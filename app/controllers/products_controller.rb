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
    @product = Product.find(params[:id])
    @skus = StockKeepingUnit.where(product_id: params[:id])
    session[:product_id] = @product.id
  end

  def neworder
    @order_item = Order.new
  end

end
