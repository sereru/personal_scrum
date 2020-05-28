class HomepagesController < ApplicationController
  def home
  end

  def new
  end

  def finish
    @kanbans = Kanban.where(stage: 4).paginate(page: params[:page])
  end
end
