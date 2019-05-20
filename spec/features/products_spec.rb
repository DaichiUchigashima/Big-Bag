require 'rails_helper'

RSpec.feature "Products", type: :feature do
  let(:product) { create(:product) }

  scenario "Show details of each information for single products" do
    visit potepan_product_path(product.id)
    within '.main-wrapper' do
      expect(page).to have_content product.name
      expect(page).to have_content product.display_price
      expect(page).to have_content product.description
    end
  end
end
