# README

Ecommerce test is a simple Ruby on Rails e-commerce site. This is by no
means a complete e-commerce site. It is meant for testing and
experimenting

- It store product information
- Listing all products through UI
- Each products can belong to many sub_categories
- User can filter products through UI by any or multiple categories.
- Categories with no products should not be shown as a filtering option
- A product should not belong to the same category tree twice
- Admin interface to manipulate data

## Developing App

Clone the Git repo

    git clone git://github.com/zhiyao/ecommerce_test
    cd ecommerce_test

Install the gem dependencies

    bundle install

To start the rails server

    rake db:create:all
    rake db:seed
    rails s

## Testing App

To test the app, you could run

    bundle exec rspec spec

To run and generate the test coverage

    SIMPLECOV=true bundle exec rspec spec

## Issues left to work on

- A way to allow the product to key in more than one sub-categories