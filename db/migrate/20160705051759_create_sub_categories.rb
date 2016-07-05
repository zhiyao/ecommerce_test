class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
      t.integer :parent_id
      t.string :name
      t.integer :position
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
