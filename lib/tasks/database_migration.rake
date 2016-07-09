namespace :database_migration do
  desc 'update products cache counters'
  task :update_product_counters do
    SubCategory.find_each { |sub_category| SubCategory.reset_counters(sub_category.id, :products) }
  end
end

