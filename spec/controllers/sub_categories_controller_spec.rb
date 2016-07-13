require 'spec_helper'

RSpec.describe SubCategoriesController, type: :controller do
  describe "GET show" do
    render_views
    before do
      @category = create(:category)
      @category2 = create(:category)
      @product = create(:product, sub_category: @category.root)
      @product2 = create(:product, sub_category: @category.root)
      @product3 = create(:product, sub_category: @category2.root)
      @category.reload
    end

    it "should show all the products under the sub_category" do
      get :show, id: @category.root
      expect(response).to be_success
      expect(response.body.match(@product.name)).to be_truthy
      expect(response.body.match(@product3.name)).to be_falsy
    end
  end
end
