class RemovePositionFromSubCategories < ActiveRecord::Migration
  def change
    remove_column :sub_categories, :position, :integer
  end
end
