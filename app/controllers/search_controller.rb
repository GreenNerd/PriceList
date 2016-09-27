class SearchController < ApplicationController
  def get
    if !params[:search].nil?
      @QUERY_SQL = "SELECT * FROM products WHERE name ~ '#{ params[:search] }'"
      #@QUERY_SQL = "SELECT products.id,             products.image_url,
      #                     products.price,          products.active,
      #                     products.name,           products.thumb,
      #                     products.pictures,       products.description,
      #                     products.category_id
      #              FROM products 
      #              INNER JOIN categories
      #              ON products.category_id = categories.id
      #              WHERE categories.name ~ '{ params[:search] }'
      #              UNION
      #              SELECT * FROM products WHERE name ~ '{ params[:seatch] }'"
      @products = Product.find_by_sql(@QUERY_SQL)
    else
      sleep(2.0)
      redirect_to root_path
    end
    @order_item = current_order.order_items.new
  end
end
