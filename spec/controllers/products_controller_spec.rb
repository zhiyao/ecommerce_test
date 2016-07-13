require 'spec_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET #index" do
    render_views
    before do
      @category = create(:category)
      @category2 = create(:category)
      @product = create(:product, sub_category: @category.root)
      @product2 = create(:product, sub_category: @category.root)
      @product3 = create(:product, sub_category: @category2.root)
    end

    it "should show all the products if no search params" do
      get :index
      expect(response).to be_success
      expect(response.body.match(@product.name)).to be_truthy
      expect(response.body.match(@product2.name)).to be_truthy
    end

    it "should show products that is link to category" do
      get :index, sub_category_ids: [@category.root.id]
      expect(response).to be_success
      expect(response.body.match(@product.name)).to be_truthy
      expect(response.body.match(@product2.name)).to be_truthy
      expect(response.body.match(@product3.name)).to be_falsy
    end
  end

  describe "GET #show" do
    render_views
    before do
      @category = create(:category)
      @category2 = create(:category)
      @product = create(:product, sub_category: @category.root)
      @product2 = create(:product, sub_category: @category.root)
      @product3 = create(:product, sub_category: @category2.root)
    end

    it "should render show and the correct product" do
      get :show, id: @product.id
      expect(response).to be_success
      expect(response.body.match(@product.name)).to be_truthy
      expect(response.body.match(@product2.name)).to be_falsy
      expect(response.body.match(@product3.name)).to be_falsy
    end

    it "should redirect to home page and render No records found if product id is not found" do
      get :show, id: 10000
      expect(response).to redirect_to products_path
      expect(flash.now).not_to be_nil
    end
  end
end
