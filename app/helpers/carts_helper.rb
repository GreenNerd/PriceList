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

  def get_type_by_oi(oi)
    if oi.present?
      sid = oi.stock_keeping_unit_id
      @sku = StockKeepingUnit.find_by(id: sid)
      if @sku.product_type != ""
        return @sku.product_type
      end
    end
    return "无"
  end

  def get_types_by_oi(oi)
    if oi.present?
      sid = oi.stock_keeping_unit_id
      @sku = StockKeepingUnit.find_by(id: sid)
      pid = @sku.product_id
      @skus = StockKeepingUnit.where(product_id: pid)
      types = @skus.map { |sku| sku.product_type }
      if types.present?
        return types
      end
    end
    return []
  end

  def get_thumb_by_oi(oi)
    if oi.present?
      @sku = StockKeepingUnit.find_by(id: "#{ oi.stock_keeping_unit_id }")
      @pro = Product.find_by(id: "#{ @sku.product_id }")
      return @pro.thumb[0]
    end
    return "default.jpg"
  end

  def qiniu_cart_thumb(oi)
    qiniu_image_url(get_thumb_by_oi(oi), :cart)
  end

end
