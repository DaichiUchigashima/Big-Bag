class Potepan::ProductsController < ApplicationController
  MAX_RELATED_PRODUCTS = 9

  def show
    @product = Spree::Product.find(params[:id])
    @related_products = @product.related_products.limit(MAX_RELATED_PRODUCTS)
  end
end
