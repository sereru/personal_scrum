class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to controller: 'kanbans', action: 'new'
    else
      render 'tags/new'
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_back fallback_location: root_url
  end

  def show
  end

private

  def tag_params
    params.require(:tag).permit(:name)
  end

end