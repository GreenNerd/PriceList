class SitesAdminController < ApplicationController
  def index
    @products = Product.page(params[:page])
    @onsales = Product.where("onsale = ?", true)
    @dnsales = Product.where("onsale = ?", false)
    logger.info @products.empty?
  end

  def create
    @product = Product.new
    @sku = StockKeepingUnit.new
    @categories = Category.where("parent = ?", 0)
  end

  def manage
    pros = params[:del_products].to_a
    if params[:del_products].present?
      if params[:up].present?
        pros.each { |p| @pro = Product.find_by_id(p.to_i); @pro.update_attribute(:onsale, true) }
      elsif params[:down].present?
        pros.each { |p| @pro = Product.find_by_id(p.to_i); @pro.update_attribute(:onsale, false) }
      elsif params[:del].present?
        Product.destroy(params[:del_products])
      end
    end
    redirect_to sites_admin_index_url
  end

end
