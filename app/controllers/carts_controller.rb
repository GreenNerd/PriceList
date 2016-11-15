class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
  end

  def genpdf
    @order_items = current_order.order_items
    @order = current_order

    respond_to do |format|
      format.html
      format.pdf do
        pdf = GenPdf.new(@order_items, @order)
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', :disposition => 'inline'
      end
    end
  end

end
