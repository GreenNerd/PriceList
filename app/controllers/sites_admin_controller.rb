class SitesAdminController < ApplicationController
  def index
    @products = Product.all
  end
end
