require 'spec_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET index" do
    render_views
    it "should render" do
      get :index
      expect(response).to be_success
    end

    it "should render category that are active" do
      category = create(:category)
      category2 = create(:category)
      product = create(:product, sub_categories: [category.root])

      get :index
      expect(response.body.match(category.name)).to be_truthy
      expect(response.body.match(category2.name)).to be_falsy
    end
  end
end
