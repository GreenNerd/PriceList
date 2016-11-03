class SearchController < ApplicationController
  def get
    @products = Product.page(params[:page])
    if !params[:search].nil?
      if params[:search].include? " "
        @SQL_MATCH = params[:search].split(/ /).join("|")
        @QUERY_SQL = "SELECT * FROM products WHERE name ~ '#@SQL_MATCH'"
      else
        @QUERY_SQL = "SELECT * FROM products WHERE name ~ '#{ params[:search] }'"
      end
      @products = Product.find_by_sql(@QUERY_SQL)
    end
    @order_item = current_order.order_items.new
  end
end
