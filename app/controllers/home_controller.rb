
class HomeController < ApplicationController
  def index
    @categories = Category.active
  end
end
