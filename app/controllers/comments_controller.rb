class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to product_path(@comment.product.alias), notice: t(:added, model: t(:comment, scope: 'activerecord.models'))
    else
      
      binding.pry
      
      redirect_to product_path(@comment.product.alias)
    end
  end

  def destroy
    @comment.destroy
    format.html { redirect_to product_path(@comment.product), notice: t(:deleted, model: t(:comment, scope: 'activerecord.models')) }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:user_id, :product_id, :body)
    end
end
