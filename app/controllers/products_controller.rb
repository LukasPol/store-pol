class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  # GET /products
  # def index
  #   @products = Product.all
  # end

  # GET /products/1
  def show
    @comments = @product.comments
    @comment = Comment.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find_by(alias: params[:alias])
    end
end
