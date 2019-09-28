class CommentsController < ApplicationController
  def create
    @entry = Entry.find(params[:entry_id])
    @comment = @entry.comments.new(comment_params)
    @comment.save!

    redirect_to @entry
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!

    redirect_to @comment.entry
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
