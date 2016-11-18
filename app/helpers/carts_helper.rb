module CartsHelper

  def get_product_name(order_item)
    if order_item.present?
      sid = order_item.stock_keeping_unit_id
      @sku = StockKeepingUnit.find_by(id: sid)
      pid = @sku.product_id
      @product = Product.find_by(id: pid)
      return @product.name
    else
      return null
    end
  end

  def get_product_id(order_item)
    if order_item.present?
      sid = order_item.stock_keeping_unit_id
      @sku = StockKeepingUnit.find_by(id: sid)
      return @sku.product_id
    end
  end

end
