require 'rails_helper'

RSpec.feature "Categories", type: :feature do
  feature "general view" do
    given(:taxonomy) { create(:taxonomy) }
    given(:taxon) { create(:taxon, taxonomy: taxonomy) }
    given(:product) { create(:product, taxons: [taxon]) }

    before { visit potepan_category_path(taxon.id) }

    scenario "Show details of each information for categories pages" do
      expect(page).to have_title "#{taxon.name} - BIGBAG Store"
      within ".page-title" do
        expect(page).to have_content taxon.name
      end
    end
  end
end
