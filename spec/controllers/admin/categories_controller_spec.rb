require 'spec_helper'

RSpec.describe Admin::CategoriesController, type: :controller do
  describe "GET #index" do
    it "should render" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "should render" do
      get :new
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "should render" do
      category = create(:category)
      get :edit, id: category.id
      expect(response).to be_success
    end
  end

  describe "DELETE #destroy" do
    it "should allow destroy" do
      category = create(:category)
      delete :destroy, id: category.id
      expect(response).to redirect_to admin_categories_path
    end

    it "should not allow destroy" do
      category = create(:category)
      allow(Category).to receive(:find).and_return(category)
      allow(category).to receive(:destroy).and_return(false)
      delete :destroy, id: category.id
      expect(flash[:error]).to eq('Error destroying')
      expect(response).to redirect_to admin_categories_path
    end
  end

  describe "PATCH #update" do
    it "should update category" do
      category = create(:category)
      name = 'foorbar'
      patch :update, id: category.id, category: { name: name }
      expect(flash.now).not_to be_nil
      category.reload
      expect(category.name).to eq(name)
      expect(response).to redirect_to admin_categories_path
    end

    it "should not update category" do
      category = create(:category)
      name = ''
      patch :update, id: category.id, category: { name: name }
      expect(flash.now).not_to be_nil
      expect(response).to render_template('admin/categories/edit')
    end
  end

  describe "POST #create" do
    it "should create category" do
      category_params = attributes_for(:category)
      post :create, category: category_params
      new_category = Category.last
      expect(new_category.name).to eq(category_params[:name])
      expect(response).to redirect_to admin_categories_path
      expect(flash.now).not_to be_nil
    end

    it "should have error" do
      category_params = { category: { name: '' } }
      post :create, category: category_params
      expect(response).to render_template('admin/categories/new')
      expect(flash.now).not_to be_nil
    end
  end
end
