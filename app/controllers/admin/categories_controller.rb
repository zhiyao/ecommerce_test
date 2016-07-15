module Admin
  class CategoriesController < BaseController
    before_filter :get_category, only: [:edit, :destroy, :update]

    def index
      @categories = Category.order(:name).page params[:page]
    end

    def new
      @category = Category.new
    end

    def edit
    end

    def destroy
      if @category.destroy
        flash[:notice] = 'Successfully destroy'
        redirect_to admin_categories_path
      else
        flash[:error] = 'Error destroying'
        redirect_to admin_categories_path
      end
    end

    def update
      if @category.update_attributes(category_params)
        redirect_to admin_categories_path,
          notice: 'Successfully updating category'
      else
        flash[:error] = 'Error updating product'
        render 'edit'
      end
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to admin_categories_path,
          notice: 'Successfully creating category'
      else
        flash[:error] = 'Error creating product'
        render 'new'
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
