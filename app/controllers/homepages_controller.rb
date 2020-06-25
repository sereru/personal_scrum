class HomepagesController < ApplicationController
  def home
    ''' 
    todos_stage = 1
    doings_stage = 2
    checkings_stage = 3
    finishs_stage = 4
    # feed同じやり方で撮ってこないと呼び出せない
    # @kanbansだけは特殊で元々紐付けされてるから呼び出せる
    @todoes = Kanban.where(stage: 1)
    @doings = Kanban.where(stage: 2)
    @checkings = Kanban.where(stage: 3)
    @finishs = Kanban.where(stage: 4)
    '''
    cnt = Lane.count
    @lanes = Lane.order(:stage).limit(cnt-1)
  end

  def new
  end

  def finish
    @lane = Lane.last
    '''
    lane = Lane.where(name: '')
    haizai_stage = lane.stage
    @kanbans = Kanban.where(stage: haizai_stage).paginate(page: params[:page])
    '''
  end


end
