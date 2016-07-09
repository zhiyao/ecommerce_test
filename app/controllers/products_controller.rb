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

  def build_params
    if params[:sub_category_id]
      sub_category = SubCategory.find(params[:sub_category_id])
      return {sub_category_id_in: sub_category.node_and_descendants_ids}
    end
    if params[:sub_category_ids]
      sub_category_ids = SubCategory.set_node_and_descendants_ids(params[:sub_category_ids])
      return {sub_category_id_in: sub_category_ids}
    end
  end
end
