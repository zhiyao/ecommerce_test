module Admin
  class ProductsController < BaseController
    def index

    end

    def new
      @product = Product.new
    end
  end
end
