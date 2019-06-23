require 'rails_helper'

RSpec.describe Spree::Product, type: :model do
  describe "#related_products" do
    let!(:taxon) { create(:taxon) }
    let!(:taxon_1) { create(:taxon) }
    let!(:product) { create(:product, taxons: [taxon, taxon_1]) }
    let!(:product_1) { create(:product, taxons: [taxon]) }
    let!(:product_2) { create(:product, taxons: [taxon_1]) }

    it "select a product from same category" do
      expect(product.related_products).to match_array [product_1, product_2]
    end
  end
end
