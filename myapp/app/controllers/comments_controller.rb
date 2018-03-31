class CommentsController < ApplicationController
  def create
    @noticium = Noticium.find(params[:noticium_id])
    @comment = @noticium.comments.create(params[:comment].permit(:name, :body))
    redirect_to noticium_path(@noticium)
  end

end
