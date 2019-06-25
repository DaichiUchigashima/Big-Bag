require 'rails_helper'

RSpec.describe Potepan::ProductsController, type: :controller do
  describe "#show" do
    let!(:taxon) { create(:taxon) }
    let!(:product) { create(:product, taxons: [taxon]) }
    let!(:related_products) { create_list(:product, 10, taxons: [taxon]) }

    before { get :show, params: { id: product.id } }

    it 'assigns @product' do
      expect(assigns(:product)).to eq product
    end

    it 'has a 200 status code' do
      expect(response).to have_http_status 200
    end

    it 'renders the :show template' do
      expect(response).to render_template :show
    end

    it 'has correct number of @related_products' do
      expect(assigns(:related_products)).to eq related_products[0..8]
      expect(assigns(:related_products).length).to eq 9
    end
  end
end
