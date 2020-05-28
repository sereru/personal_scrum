class HomepagesController < ApplicationController
  def home
  end

  def new
  end

  def finish
    @kanbans = Kanban.where(stage: 5).paginate(page: params[:page])
  end
end
