class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  # GET /categories
  def index
    @q = Category.all.ransack(params[:q])
    @categories = @q.result(distinct: true)
  end

  # GET /categories/1
  def show
    @q = @category.products.ransack(params[:q])
    @products = @q.result(distinct: true)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find_by(alias: params[:alias])
    end
end
