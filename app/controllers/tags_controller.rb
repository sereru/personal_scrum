class TagsController < ApplicationController
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

  def show
  end

private

  def tag_params
    params.require(:tag).permit(:name)
  end

end