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

  describe 'GET #new' do
    before { get :new }

    it 'assignsa new Product to @product' do
      expect(assigns(:product)).to be_a_new(Product)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'product is saved in the database' do
        expect { post :create, params: { product: attributes_for(:product) } }.to change(Product, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { product: attributes_for(:product) }
        expect(response).to redirect_to assigns(:product)
      end
    end

    context 'with invalid attributes' do
      it 'product is not saved in the database' do
        expect { post :create, params: { product: attributes_for(:product, :invalid) } }.not_to change(Product, :count)
      end

      it 're-renders new view' do
        post :create, params: { product: attributes_for(:product, :invalid) }
        expect(response).to render_template :new
      end
    end
  end
end
