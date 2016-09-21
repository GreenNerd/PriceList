class SearchController < ApplicationController
  def get
    if !params[:search].nil?
      @QUERY_SQL = "SELECT * FROM products WHERE name ~ '#{ params[:search] }'"
      @products = Product.find_by_sql(@QUERY_SQL)
    else
      render html: "no results"
    end
    @order_item = current_order.order_items.new
  end
end
