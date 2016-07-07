module Admin
  class SubCategoriesController < BaseController
    def new
      @sub_category = SubCategory.new
      @sub_category_parent = SubCategory.find(params[:parent])
      @sub_category_parent_id = @sub_category_parent.id
      @category = Category.find(params[:category_id])
    end

    def create
      @sub_category = SubCategory.new(sub_category_params)
      @category = Category.find(params[:category_id])

      if @sub_category.save
        redirect_to edit_admin_category_path(@category),
          notice: 'Successfully save'
      else
        flash[:error] = 'Error saving'
        render 'new'
      end
    end

    private
    def sub_category_params
      params[:sub_category].permit(:name, :parent_id, :position, :category_id)
    end
  end
end
