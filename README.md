# README

Ecommerce test is a simple Ruby on Rails e-commerce site. This is by no
means a complete e-commerce site. It is meant for testing and
experimenting

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



