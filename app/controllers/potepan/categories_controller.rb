class Potepan::CategoriesController < ApplicationController
  def show
    @taxon = Spree::Taxon.find(params[:id])
    @taxonomies = Spree::Taxonomy.includes(:root)
    @products = @taxon.products.all.includes(master: [:default_price, :images])
  end
end