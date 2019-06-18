require 'rails_helper'

RSpec.describe Potepan::ProductsController, type: :controller do
  describe "#show" do
    let(:taxon) { create(:taxon) }
    let(:product) { create(:product) }
    let(:related_products) { create_list(:product, 9, taxons: taxon) }

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

    it 'assigns @related_products' do
      expect(assigns(:related_products)).to eq related_products[0..7]
      #without already selected item in the carousel
      expect(assigns(:related_products)).not_to include(product)
    end
  end
end
