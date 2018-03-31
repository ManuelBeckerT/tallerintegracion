class CommentsController < ApplicationController
  def create
    @noticium = Noticium.find(params[:noticium_id])
    @comment = @noticium.comments.create(params[:comment].permit(:name, :body))
    redirect_to noticium_path(@noticium)
  end

  def destroy
    @noticium = Noticium.find(params[:noticium_id])
    @noticium.comentario += 1
    @comment = @noticium.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

end
