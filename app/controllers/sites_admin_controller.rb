class SitesAdminController < ApplicationController
  def index
    @products = Product.page(params[:page])
    @product = Product.find_by_id(1)
  end

  def create
    @product = Product.new
    @sku = StockKeepingUnit.new
    @categories = Category.where("parent = ?", 0)
  end
end
