require 'spec_helper'

RSpec.describe Admin::ProductsController, type: :controller do
  describe 'GET #index' do
    it 'should render' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'should render' do
      get :new
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    render_views
    it 'should render' do
      product = create(:product)
      get :edit, id: product.id
      expect(response).to be_success
    end
  end

  describe 'DELETE #destroy' do
    it 'should Successfully destroy' do
      product = create(:product)
      delete :destroy, id: product.id
      expect(response).to redirect_to admin_products_path
    end

    it 'should not allow destroy if product is not found' do
      product = create(:product)
      allow(Product).to receive(:find).and_return(product)
      allow(product).to receive(:destroy).and_return(false)
      delete :destroy, id: product.id
      expect(flash[:error]).to eq('Error destroying')
      expect(response).to redirect_to admin_products_path
    end
  end

  describe 'PATCH #update' do
    it 'should update product' do
      product = create(:product)
      description = 'foobar'
      patch :update, id: product.id, product: { description: description }
      expect(flash.now).not_to be_nil
      product.reload
      expect(product.description).to eq(description)
      expect(response).to redirect_to admin_products_path
    end

    it 'should not update product' do
      product = create(:product)
      name = ''
      patch :update, id: product.id, product: { name: name }
      expect(flash.now).not_to be_nil
      expect(response).to render_template('admin/products/edit')
    end
  end

  describe 'POST #create' do
    it 'should be Successfully create' do
      product_params = attributes_for(:product)
      post :create, product: product_params
      new_product = Product.last
      expect(new_product.name).to eq(product_params[:name])
      expect(response).to redirect_to admin_products_path
      expect(flash.now).not_to be_nil
    end

    it 'should have error' do
      product_params = { product: { description: 'test' } }
      post :create, product: product_params
      expect(response).to render_template('admin/products/new')
      expect(flash.now).not_to be_nil
    end
  end
end
