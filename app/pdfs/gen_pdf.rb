require 'prawn'
require 'prawn/table'

class GenPdf < Prawn::Document
  def initialize(order_items)
    super()
    @items = order_items
    header
    text_content
    table_content
  end

  def header
    # This inserts an image in the pdf file and set the size of the image
    image "#{Rails.root}/app/assets/images/QR.png"
  end

  def text_content
    # The cursor for inserting content starts on the top of the page. Here we move it down a little to create more space between the text and image inserted above
    y_position = cursor - 30

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([0, y_position], :width => 270, :height => 300) do
      font("#{Prawn::DATADIR}/fonts/msyh.ttf", :size => 12) do
        text "存储互联二维码", :align => :center
      end
    end

  end

  def table_content
    # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
    table item_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [100, 100, 100, 100, 100]
    end
  end

  def item_rows
    [['#', 'name', 'Unit Price', 'quantity', 'Total Price']] +
      @items.map do |item|
      if item.present?
        sid = item.stock_keeping_unit_id
        @sku = StockKeepingUnit.find_by(id: sid)
        pid = @sku.product_id
        @product = Product.find_by(id: pid)
        pname = @product.name
      end
      [item.id, item.quantity, item.unit_price, item.quantity, item.total_price]
    end
  end
end
