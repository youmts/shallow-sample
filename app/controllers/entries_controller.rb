class EntriesController < ApplicationController
  before_action :set_blog, only: %i(new create)
  before_action :set_entry, only: %i(show edit update destroy)

  def show
  end

  def new
    @entry = @blog.entries.new
  end

  def edit
  end

  def create
    @entry = @blog.entries.new(entry_params)

    if @entry.save
      redirect_to @entry, notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  def update
    if @entry.update(entry_params)
      redirect_to @entry, notice: 'Entry was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @entry.destroy
    redirect_to @entry.blog, notice: 'Entry was successfully destroyed.'
  end

  private
    def set_blog
      @blog = Blog.find(params[:blog_id])
    end

    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(:title, :body, :blog_id)
    end
end
