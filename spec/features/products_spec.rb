require 'rails_helper'

RSpec.feature "Products", type: :feature do
  given!(:taxon) { create(:taxon) }
  given!(:product) { create(:product, taxons: [taxon]) }
  given!(:related_products) { create_list(:product, 9, taxons: [taxon]) }

  before { visit potepan_product_path(product.id) }

  scenario "Show details of each information for single products" do
    within '.main-wrapper' do
      expect(page).to have_content product.name
      expect(page).to have_content product.display_price
      expect(page).to have_content product.description
    end
  end

  scenario "Show details of each information for related products" do
    related_products.each do |related_product|
      within '.productsContent' do
        expect(page).to have_content related_product.name
        expect(page).to have_content related_product.display_price
      end
    end
  end

  scenario "Move to correct product page when you click on each products in the product_box" do
    click_on related_products.first.name
    expect(page.current_path).to eq potepan_product_path(related_products.first.id)
  end
end
