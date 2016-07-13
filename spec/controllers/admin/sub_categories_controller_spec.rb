require 'spec_helper'

RSpec.describe Admin::SubCategoriesController, type: :controller do
  describe "GET #new" do
    it "should show render" do
      category = create(:category)
      get :new, parent: category.root.id, category_id: category.id
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    it "should create sub category" do
      category = create(:category)
      sub_category_params = attributes_for(:sub_category)
      post :create, category_id: category.id, sub_category: sub_category_params
      @category = Category.last
      expect(response).to redirect_to edit_admin_category_path(@category)
    end

    it "should have error saving category" do
      category = create(:category)
      sub_category_params = { sub_category: { name: '' } }
      post :create, category_id: category.id, sub_category: sub_category_params
      expect(response).to render_template('admin/sub_categories/new')
      expect(flash.now).not_to be_nil
    end
  end
end
