class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(12)
    if params[:search]
      @products = Product.find_by(name: params[:search])
    else
      #
    end
    @order_item = current_order.order_items.new
  end
end
