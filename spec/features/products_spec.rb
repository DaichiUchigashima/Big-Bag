require 'rails_helper'

RSpec.feature "Products", type: :feature do
  given!(:taxon) { create(:taxon) }
  given!(:product) { create(:product, taxons: [taxon]) }
  given!(:related_product) { create(:product, taxons: [taxon]) }

  before { visit potepan_product_path(product.id) }

  scenario "Show details of each information for single products" do
    within '.main-wrapper' do
      expect(page).to have_content product.name
      expect(page).to have_content product.display_price
      expect(page).to have_content product.description
    end
  end

  scenario "Show details of each information for related products" do
    within '.productsContent' do
      expect(page).to have_content related_product.name
      expect(page).to have_content related_product.display_price
    end
  end

  scenario "Move to correct product page when you click on each products in the product_box" do
    click_on related_product.name
    expect(page.current_path).to eq potepan_product_path(related_product.id)
  end
end
