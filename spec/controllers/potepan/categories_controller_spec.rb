require 'rails_helper'

RSpec.describe Potepan::CategoriesController, type: :controller do
  describe "#show" do
    let(:taxonomy) { create(:taxonomy) }
    let(:taxon) { create(:taxon, taxonomy: taxonomy) }

    before { get :show, params: { id: taxon.id } }

    it 'has a 200 status code' do
      expect(response).to have_http_status 200
    end

    it 'renders the :show template' do
      expect(response).to render_template :show
    end

    it 'assigns @taxon' do
      expect(assigns(:taxon)).to eq(taxon)
    end

    it 'assigns @taxonomies' do
      expect(assigns(:taxonomies)).to match_array(taxonomy)
    end
  end
end
