class HomepagesController < ApplicationController
  def home
    # feed同じやり方で撮ってこないと呼び出せない
    # @kanbansだけは特殊で元々紐付けされてるから呼び出せる
    @todoes = Kanban.where(stage: 1)
    @doings = Kanban.where(stage: 2)
    @checkings = Kanban.where(stage: 3)
    @finishs = Kanban.where(stage: 4)
  end

  def new
  end

  def finish
    @kanbans = Kanban.where(stage: 5).paginate(page: params[:page])
  end


end
