require 'rails_helper'

RSpec.describe Spree::Product, type: :model do
  describe "#related_products" do
    let!(:taxon_1) { create(:taxon) }
    let!(:taxon_2) { create(:taxon) }
    let!(:taxon_another) { create(:taxon) }
    let!(:product_1) { create(:product, taxons: [taxon_1, taxon_2, taxon_another]) }
    let!(:product_2) { create(:product, taxons: [taxon_1, taxon_2]) }
    let!(:product_another) { create(:product, taxons: [taxon_1, taxon_another]) }

    it "selects a product from same category" do
      expect(product_1.related_products).to contain_exactly(product_2, product_another)
    end
  end
end
