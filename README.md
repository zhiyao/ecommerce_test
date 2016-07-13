# README

Ecommerce test is a simple Ruby on Rails e-commerce site. This is by no
means a complete e-commerce site. It is meant for testing and
experimenting

1) It store product information
2) listing all products through UI
3) each products can belong to many sub_categories
4) User can filter products through UI by any or multiple categories.
5) Categories with no products should not be shown as a filtering option
6) a product should not belong to the same category tree twice
7) Admin interface to manipulate data

## Developing App

Clone the Git repo

    git clone git://github.com/zhiyao/ecommerce_test
    cd ecommerce_test

Install the gem dependencies

    bundle install

To start the rails server

    rake db:create:all
    rails s

## Testing App

To test the app, you could run

    bundle exec rspec spec

To run and generate the test coverage

    SIMPLECOV=true bundle exec rspec spec
