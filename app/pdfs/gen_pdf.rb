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
    image "#{Rails.root}/app/assets/images/1.jpg", width: 530, height: 150
  end

  def text_content
    # The cursor for inserting content starts on the top of the page. Here we move it down a little to create more space between the text and image inserted above
    y_position = cursor - 50

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([0, y_position], :width => 270, :height => 300) do
      text "Lorem ipsum", size: 15, style: :bold
      text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse interdum semper placerat."
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
      self.column_widths = [40, 300, 200]
    end
  end

  def item_rows
    [['#', 'name', 'Price']] +
      @itemss.map do |items|
      [item.id, item.quantity, item.total_price]
    end
  end
end
