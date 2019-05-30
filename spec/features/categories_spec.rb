require 'rails_helper'

RSpec.feature "Categories", type: :feature do
  feature "general view" do
    given(:taxonomy) { create(:taxonomy) }
    given(:taxon_root) { taxonomy.root }
    given!(:taxon) { create(:taxon, taxonomy: taxonomy, parent: taxon_root) }
    given!(:product) { create(:product, taxons: [taxon]) }

    before { visit potepan_category_path(taxon.id) }

    scenario "Show parts of the page" do
      expect(page).to have_title "#{taxon.name} - BIGBAG Store"

      within ".page-title" do
        expect(page).to have_content taxon.name
      end

      within ".productCaption" do
        expect(page).to have_content product.name
        expect(page).to have_content product.display_price
      end
    end

    scenario "Get reactions from each buttons to move to correct pages when you click on each buttons of categories" do
      click_on taxon.name
      expect(page.current_path).to eq potepan_category_path(taxon.id)
      expect(page).to have_title "#{taxon.name} - BIGBAG Store"
      expect(page).to have_content taxonomy.name
    end

    scenario "Move to correct product page when you click on each products in the product_box" do
      click_on product.name
      expect(page.current_path).to eq potepan_product_path(product.id)
      expect(page).to have_title "#{product.name} - BIGBAG Store"
      expect(page).to have_content product.name
      expect(page).to have_content product.display_price

      #within ".productBox" do
        #expect(page).to have_content product.display_image
      #end

    end
  end
end
