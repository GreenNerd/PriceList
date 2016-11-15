require 'prawn'
require 'prawn/table'

class GenPdf < Prawn::Document
  def initialize(order_items, order)
    super()
    @items = order_items
    @order = order
    table_content
    order_content
    header
    text_content
  end

  def header
    # This inserts an image in the pdf file and set the size of the image
    move_down 20
    image "#{Rails.root}/app/assets/images/QR.png"
    move_down 20
  end

  def text_content
    font("#{Prawn::DATADIR}/fonts/simkai.ttf", :size => 12) do
      text "存储互联二维码", :align => :center
    end
  end

  def table_content
    # This makes a call to item_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
    table item_rows do
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [100, 100, 100, 100, 100]
      self.cell_style = {size: 12, :font => "#{Prawn::DATADIR}/fonts/simkai.ttf"}
    end
  end

  def item_rows
    [['商品分类', '商品名称', '商品单价', '商品数量', '商品总价']] +
      @items.map do |item|
      if item.present?
        sid = item.stock_keeping_unit_id
        @sku = StockKeepingUnit.find_by(id: sid)
        pid = @sku.product_id
        @product = Product.find_by(id: pid)
        pname = @product.name
        cid = @product.category_id
        @category = Category.find_by(id: cid)
        cname = @category.name
      end
      [pname, cname, item.unit_price, item.quantity, item.total_price]
    end
  end

  def order_content
    move_down 10
    table order_rows do
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths= [250, 250]
      self.cell_style = {size: 13, :font => "#{Prawn::DATADIR}/fonts/simkai.ttf"}
    end
  end
  
  def order_rows
    [['商品件数', +'价格合计']] +
      [[@order.total, @order.subtotal]]
  end
end
