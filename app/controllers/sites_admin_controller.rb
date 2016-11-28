class SitesAdminController < ApplicationController
  def index
    @products = Product.page(params[:page])
  end

  def create
    @product = Product.new
    @sku = StockKeepingUnit.new
    @category = Category.new
  end
end
