module Admin
  class ProductsController < BaseController
    before_filter :get_product, only: [:edit, :destroy, :update]

    def index
      @products = Product.includes(:sub_categories).order(:name).page params[:page]
    end

    def new
      @product = Product.new
    end

    def edit
    end

    def destroy
      if @product.destroy
        flash[:notice] = 'Successfully destroy'
      else
        flash[:error] = 'Error destroying'
      end
      redirect_to admin_products_path
    end

    def update
      if @product.update_attributes(product_params)
        redirect_to admin_products_path,
                    notice: 'Successfully updating product'
      else
        flash[:error] = 'Error updating'
        render 'edit'
      end
    end

    def create
      @product = Product.new(product_params)

      if @product.save
        redirect_to admin_products_path,
                    notice: 'Successfully creating product'
      else
        flash[:error] = 'Error creating'
        render 'new'
      end
    end

    private

    def get_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :image, sub_category_ids: [])
    end
  end
end
