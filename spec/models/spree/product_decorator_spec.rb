require 'rails_helper'

RSpec.describe Spree::Product, type: :model do
  describe "#related_products" do
    let!(:taxon_1) { create(:taxon) }
    let!(:taxon_2) { create(:taxon) }
    let!(:taxon_3) { create(:taxon) }
    let!(:product) { create(:product, taxons: [taxon_1, taxon_2, taxon_3]) }
    let!(:product_1) { create(:product, taxons: []) }
    let!(:product_2) { create(:product, taxons: [taxon_1]) }
    let!(:product_3) { create(:product, taxons: [taxon_2, taxon_3]) }

    it "selects a product from same category" do
      expect(product.related_products).to contain_exactly(product_2, product_3)
    end
  end
end
