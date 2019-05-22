require 'rails_helper'

RSpec.describe Potepan::ProductsController, type: :controller do
  describe "#show" do
    let(:product) { create(:base_product) }

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
  end
end
