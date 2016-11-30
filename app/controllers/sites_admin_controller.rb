class SitesAdminController < ApplicationController
  def index
    @products = Product.page(params[:page])
  end

  def create
    @product = Product.new
    @sku = StockKeepingUnit.new
    @categories = Category.where("parent = ?", 0)
  end
end
