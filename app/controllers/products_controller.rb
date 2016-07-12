class ProductsController < ApplicationController
  def index
    @categories = Category.active
    search_params = build_params || []
    @q = Product.ransack(search_params)
    @products = @q.result
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.active
    @sub_category = @product.sub_category
  end

  private

  def sub_category_params
    params.permit(sub_category_ids: [])
  end

  def build_params
    if sub_category_params[:sub_category_ids]
      sub_category_ids = SubCategory.find_node_and_descendants_ids(params[:sub_category_ids])
    end
    {sub_category_id_in: sub_category_ids}
  end

end
