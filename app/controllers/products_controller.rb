class ProductsController < ApplicationController
  def index

  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.active
    @sub_category = @product.sub_category
    # @category = @sub_category.category
  end
end
