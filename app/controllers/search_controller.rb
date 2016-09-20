class SearchController < ApplicationController
  def get
    if !params[:search].nil?
      @products = Product.where(name: /.*(params[:search]).*/)
    else
      #
    end
    @order_item = current_order.order_items.new
  end
end
