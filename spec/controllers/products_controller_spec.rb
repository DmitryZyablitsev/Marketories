require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:product) { create(:product) }

  describe 'GET #index' do
    let(:products) { create_list(:product, 2) }

    before { get :index }

    it 'populates an array of all products' do
      expect(assigns(:products)).to match_array(products)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: product } }

    it 'assigns the requested product to @product' do
      expect(assigns(:product)).to eq product
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end
end
