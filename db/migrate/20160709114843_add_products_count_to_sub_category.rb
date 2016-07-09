class AddProductsCountToSubCategory < ActiveRecord::Migration
  def change
    add_column :sub_categories, :products_count, :integer
  end
end
