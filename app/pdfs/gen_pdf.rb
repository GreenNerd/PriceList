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
    image "#{Rails.root}/app/ass:wq

  end
end
