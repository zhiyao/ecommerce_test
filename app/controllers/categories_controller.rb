class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @categories = Category.all

    @sub_category_ids = @category.root.node_and_descendants_ids

    @q = Product.ransack({sub_category_id_in: @sub_category_ids})
    @products = @q.result
  end
end
