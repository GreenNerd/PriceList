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
    @uptoken = uptoken
    @product = Product.new
    1.times { @product.stock_keeping_units.build }
    1.times { @product.dimensions.build }
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to sites_admin_index_url
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
      redirect_to sites_admin_index_url
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

  def uptoken
    put_policy = Qiniu::Auth::PutPolicy.new(
      "pricelist",                  # 存储空间
      nil,                          # 最终资源名，可省略，即缺省为“创建”语义
      1800,                         # 相对有效期，可省略，缺省为3600秒后uptoken过期
      (Time.now + 30.minutes).to_i  # 绝对有效期，可省略，指明uptoken过期期限(绝对值)
    )
    uptoken = Qiniu::Auth.generate_uptoken(put_policy)  # 生产凭证
  end

end
