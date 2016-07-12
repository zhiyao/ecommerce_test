module Admin
  class ProductsController < BaseController
    before_filter :get_product, only: [:edit, :show, :destroy, :update]

    def index
      @products = Product.all
    end

    def new
      @product = Product.new
    end

    def show
    end

    def edit
    end

    def destroy
      if @product.destroy
        redirect_to admin_products_path
      else
        flash[:error] = 'Error destroying'
      end
    end

    def update
      if @product.update_attributes(product_params)
        redirect_to admin_products_path,
          notice: 'Successfully updating product'
      else
        flash[:error] = 'Error updating product'
        render 'edit'
      end
    end

    def create
      @product = Product.new(product_params)

      if @product.save
        redirect_to admin_products_path,
          notice: 'Successfully creating product'
      else
        flash[:error] = 'Error creating product'
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
