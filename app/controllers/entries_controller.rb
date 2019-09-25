class EntriesController < ApplicationController
  before_action :set_blog
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries/1
  def show
  end

  # GET /entries/new
  def new
    @entry = @blog.entries.new
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  def create
    @entry = @blog.entries.new(entry_params)

    if @entry.save
      redirect_to [@blog, @entry], notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /entries/1
  def update
    if @entry.update(entry_params)
      redirect_to [@blog, @entry], notice: 'Entry was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /entries/1
  def destroy
    @entry.destroy
    redirect_to @blog, notice: 'Entry was successfully destroyed.'
  end

  private
    def set_blog
      @blog = Blog.find(params[:blog_id])
    end

    def set_entry
      @entry = @blog.entries.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def entry_params
      params.require(:entry).permit(:title, :body, :blog_id)
    end
end
