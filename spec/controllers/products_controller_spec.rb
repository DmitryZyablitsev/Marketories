require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
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
end
