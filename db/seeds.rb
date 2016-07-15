def image(name, folder, type='jpg')
  images_path = Pathname.new(File.dirname(__FILE__)) + "samples/#{folder}/"
  path = images_path + "#{name}.#{type}"
  File.open(path)
end

men_category = Category.create(name: 'Men')
women_category = Category.create(name: 'Women')
camping_category = Category.create(name: 'Camping')

men_category.banner.store!(image('men', 'banner'))
men_category.save!

women_category.banner.store!(image('women', 'banner'))
women_category.save!

camping_category.banner.store!(image('camping', 'banner'))
camping_category.save!

men_shirt_sub_category = SubCategory.create(name: 'Shirt', parent: men_category.root)
jacket_sub_category = SubCategory.create(name: 'Jacket', parent: men_shirt_sub_category)
tshirt_sub_category = SubCategory.create(name: 'T-Shirt', parent: men_shirt_sub_category)
women_shirt_sub_category = SubCategory.create(name: 'Jacket', parent: women_category.root)

product_1 = Product.create(name: 'Youtube Jacket',
                           price: 14.50,
                           sub_categories: [jacket_sub_category] )
product_2 = Product.create(name: 'Android Jacket',
                           price: 19.50,
                           sub_categories: [jacket_sub_category] )
product_3 = Product.create(name: 'Black Hoodie',
                           price: 19.50, sub_categories:
                           [men_shirt_sub_category] )
product_4 = Product.create(name: 'Black and Red Hoodie',
                           price: 19.50,
                           sub_categories: [men_shirt_sub_category] )
product_5 = Product.create(name: 'Google Shirt',
                           price: 19.50,
                           sub_categories: [men_shirt_sub_category] )
product_6 = Product.create(name: 'Black Jacket',
                           price: 25.50,
                           sub_categories: [jacket_sub_category] )
product_7 = Product.create(name: 'Green Jacket',
                           price: 25.50,
                           sub_categories: [women_shirt_sub_category] )
product_8 = Product.create(name: 'Dark Green Jacket',
                           price: 25.50,
                           sub_categories: [women_shirt_sub_category] )
product_9 = Product.create(name: 'Chrome Gray Jacket',
                           price: 25.50,
                           sub_categories: [women_shirt_sub_category] )
product_10 = Product.create(name: 'Navy Blue Jacket',
                            price: 25.50,
                            sub_categories: [women_shirt_sub_category] )
product_11 = Product.create(name: 'Black Jacket',
                            price: 25.50,
                            sub_categories: [women_shirt_sub_category] )
product_12 = Product.create(name: 'Gray Blue Jacket',
                            price: 25.50,
                            sub_categories: [jacket_sub_category] )
product_13 = Product.create(name: 'Lime Green Jacket',
                            price: 25.50,
                            sub_categories: [jacket_sub_category] )
product_14 = Product.create(name: 'Light Gray Google Jacket',
                            price: 25.50,
                            sub_categories: [jacket_sub_category] )
product_15 = Product.create(name: 'Black White Hoodie',
                            price: 25.50,
                            sub_categories: [jacket_sub_category] )

(1..15).each do |i|
  eval("product_#{i}").image.store!(image(i.to_s, 'products'))
  eval("product_#{i}").description = FFaker::Lorem.paragraph
  eval("product_#{i}").save!
end
