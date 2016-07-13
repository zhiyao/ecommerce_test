class SubCategoriesController < ApplicationController
  def show
    @sub_category = SubCategory.find(params[:id])
    @categories = Category.active
    @category = @sub_category.category

    @sub_category_ids = @sub_category.node_and_descendants_ids

    @q = Product.ransack({sub_categories_id_in: @sub_category_ids})
    @products = @q.result
  end

end
