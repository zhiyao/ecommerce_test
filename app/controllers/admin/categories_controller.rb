module Admin
  class CategoriesController < BaseController

    before_filter :get_category, only: [:edit, :show, :destroy, :update]

    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def show
    end

    def edit
    end

    def destroy
      if @category.destroy
        redirect_to admin_categories_path
      else
        flash[:error] = 'Error destroying'
      end
    end

    def update
      if @category.update_attributes(category_params)
        redirect_to admin_categories_path,
          notice: 'Successfully updating category'
      else
        flash[:error] = 'Error updating product'
      end
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to admin_categories_path,
          notice: 'Successfully creating category'
      else
        flash[:error] = 'Error creating product'
      end
    end

    private
    def get_category
      @category = Category.find(params[:id])
    end

    def category_params
      params[:category].permit(:name, :position, :banner)
    end
  end
end
