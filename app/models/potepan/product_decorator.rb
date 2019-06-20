module Spree::ProductDecorator
  def related_products
    Spree::Product.in_taxons(taxons).where.not(id: id).uniq
  end

  Spree::Product.prepend self
end
