require 'spec_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'GET #index' do
    render_views
    before do
      @category = create(:category)
      @category2 = create(:category)
      @category_with_no_product = create(:category)
      @product = create(:product, sub_categories: [@category.root])
      @product2 = create(:product, sub_categories: [@category.root])
      @product3 = create(:product, sub_categories: [@category2.root])
    end

    it 'should show categories that has only products' do
      get :index
      expect(response.body.match(@category_with_no_product.name)).to be_falsy
    end

    it 'should show all the products if no filter opeions' do
      get :index
      expect(response).to be_success
      expect(response.body.match(@product.name)).to be_truthy
      expect(response.body.match(@product2.name)).to be_truthy
      expect(response.body.match(@product3.name)).to be_truthy
    end

    it 'should show products that is link to category' do
      get :index, sub_category_ids: [@category.root.id]
      expect(response).to be_success
      expect(response.body.match(@product.name)).to be_truthy
      expect(response.body.match(@product2.name)).to be_truthy
      expect(response.body.match(@product3.name)).to be_falsy
    end

    it 'should show products under its category and childrens when filtering by its parent category' do
      child = create(:sub_category, parent: @category2.root)
      grandchild = create(:sub_category, parent: child)
      product = create(:product, sub_categories: [grandchild])
      get :index, sub_category_ids: [@category2.root.id]
      expect(response.body.match(product.name)).to be_truthy
      expect(response.body.match(@product3.name)).to be_truthy
      expect(response.body.match(@product2.name)).to be_falsy
      expect(response.body.match(@product.name)).to be_falsy
    end
  end

  describe 'GET #show' do
    render_views
    before do
      @category = create(:category)
      @category2 = create(:category)
      @product = create(:product, sub_categories: [@category.root])
      @product2 = create(:product, sub_categories: [@category.root])
      @product3 = create(:product, sub_categories: [@category2.root])
    end

    it 'should render show and the correct product' do
      get :show, id: @product.id
      expect(response).to be_success
      expect(response.body.match(@product.name)).to be_truthy
      expect(response.body.match(@product2.name)).to be_falsy
      expect(response.body.match(@product3.name)).to be_falsy
    end

    it 'should redirect to home page and render No records found if product id is not found' do
      get :show, id: 999
      expect(response).to redirect_to products_path
      expect(flash.now).not_to be_nil
    end
  end
end
