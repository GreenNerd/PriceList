# encoding: utf-8

class ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page])
    if params[:search]
      @products = Product.find_by(name: params[:search])
    end
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:id])
    @skus = StockKeepingUnit.where(product_id: params[:id])
    @dimensions = Dimension.where(product_id: params[:id])
    @mount = @skus.sum(:inventory_count)
    session[:product_id] = @product.id

    @order_item = current_order.order_items.new
  end

  def neworder
    @order_item = Order.new
  end

  def new
    @product = Product.new
    1.times { @product.stock_keeping_units.build }
    1.times { @product.dimensions.build }
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :action => 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:id, {thumb: []}, {pictures: []}, {image_url: []}, :price, :active, :name, :thumb, :category_id,
                                    :pictures, :description, stock_keeping_units_attributes: [:id, :inventory_count, :product_type, :prices, :dimensions, :_destroy],
                                    dimensions_attributes: [:id, :key, :val, :_destroy])
  end
end
