class CreateSubCategoriesProducts < ActiveRecord::Migration
  def change
    create_table :sub_categories_products do |t|
      t.references :sub_category
      t.references :product

      t.timestamps null: false
    end
    add_index :sub_categories_products, [:sub_category_id, :product_id]
  end
end
