require 'rails_helper'

RSpec.describe Potepan::ProductsController, type: :controller do
  describe "#show" do
    let(:product) { create(:base_product) }

    before { get :show, params: { id: product.id } }

    it 'has a 200 status code' do
      expect(response).to have_http_status 200
    end

    it 'responds successfully' do
      expect(response).to be_successful
    end

    it 'renders the :show template' do
      expect(response).to render_template :show
    end
  end
end
