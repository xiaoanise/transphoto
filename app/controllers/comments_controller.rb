class CommentsController < ApplicationController
  def create
    @transphoto = Transphoto.find(params[:transphoto_id])
    @comments = @transphoto.comments
    @comment = Comment.new(comment_params)
    @comment.transphoto_id = @transphoto.id
    if @comment.save
      redirect_to transphoto_path(@transphoto.id)
    else
      render template: 'transphotos/show'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:transphoto_id, :content).merge(user_id: current_user.id, transphoto_id: params[:transphoto_id])
  end
end
