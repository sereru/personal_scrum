class KanbansController < ApplicationController
  def new
    @kanban = Kanban.new
  end

  def create
    @kanban = Kanban.new(kanban_params)
    puts @kanban
    if @kanban.save
      flash[:success] = "看板登録完了"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @kanban = Kanban.find(params[:id])
    @kanban.destroy
    redirect_back fallback_location: root_url
  end

  def next
    kanban = Kanban.find(params[:id])
    @relation = LaneKanbanRelation.find_by(kanban_id: kanban.id)
    now_line = Lane.find_by(id: @relation.lane_id)
    next_stage = now_line.stage + 1
    next_lane = Lane.find_by(stage: next_stage)
    @relation.lane_id = next_lane.id
    if @relation.save
      redirect_back fallback_location: root_url
    else
      redirect_to root_url
    end
  end

  def before
    kanban = Kanban.find(params[:id])
    @relation = LaneKanbanRelation.find_by(kanban_id: kanban.id)
    now_line = Lane.find_by(id: @relation.lane_id)
    before_stage = now_line.stage - 1
    before_lane = Lane.find_by(stage: before_stage)
    @relation.lane_id = before_lane.id
    if @relation.save
      redirect_back fallback_location: root_url
    else
      redirect_to root_url
    end
  end

  def import
    Kanban.import(params[:file])
    redirect_to root_url
  end

  private

   def kanban_params
      params.require(:kanban).permit(:content, :deadline, :lane_ids, tag_ids: [])
   end
end
