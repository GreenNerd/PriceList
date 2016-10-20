class SearchController < ApplicationController
  def get
    @products =
      if params[:search].present?
        Product.where('name ~ ?', params[:search].split(' ').join('|'))
               .page(params[:page] || 1)
      else
        Product.none
      end

    @order_item = current_order.order_items.new
  end
end
