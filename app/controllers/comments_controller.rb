class CommentsController < ApplicationController
  before_action :set_blog, :set_entry
  before_action :set_comment, only: :destroy

  def create
    @comment = @entry.comments.new(comment_params)
    @comment.save!

    redirect_to [@blog, @entry]
  end

  def destroy
    @comment.destroy!

    redirect_to [@blog, @entry]
  end

  private

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end

  def set_entry
    @entry = @blog.entries.find(params[:entry_id])
  end

  def set_comment
    @comment = @entry.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
