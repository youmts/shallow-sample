class User::CommentsController < ApplicationController
  def create
    @entry = Entry.find(params[:entry_id])
    @comment = @entry.comments.new(comment_params)
    @comment.save!

    redirect_to [:user, @entry]
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!

    redirect_to [:user, @comment.entry]
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
