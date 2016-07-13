module Admin
  class ProductsController < BaseController
    before_filter :get_product, only: [:edit, :destroy, :update]

    def index
      @products = Product.includes(:sub_categories).all
    end

    def new
      @product = Product.new
    end

    def edit
    end

    def destroy
      if @product.destroy
        flash[:notice] = 'Successfully destroy'
        redirect_to admin_products_path
      else
        flash[:error] = 'Error destroying'
        redirect_to admin_products_path
      end
    end

    def update
      if @product.update_attributes(product_params)
        redirect_to admin_products_path,
          notice: 'Successfully updating product'
      else
        flash[:error] = @product.errors.full_messages
        render 'edit'
      end
    end

    def create
      @product = Product.new(product_params)

      if @product.save
        redirect_to admin_products_path,
          notice: 'Successfully creating product'
      else
        flash[:error] = @product.errors.full_messages
        render 'new'
      end
    end

    private

    def get_product
      @product = Product.find(params[:id])
    end

    def product_params
      params[:product].permit(:name, :description, :price, :sub_category_id, :image)
    end
  end
end
