class KanbansController < ApplicationController
  def new
    @kanban = Kanban.new
  end

  def create
    @kanban = Kanban.new(kanban_params)
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
    @relation.lane_id += 1
    if @relation.save
      redirect_back fallback_location: root_url
    else
      redirect_to root_url
    end
  end

  def before
    kanban = Kanban.find(params[:id])
    @relation = LaneKanbanRelation.find_by(kanban_id: kanban.id)
    @relation.lane_id -= 1
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
      params.require(:kanban).permit(:content, :deadline, lane_ids: [], tag_ids: [])
   end

   def lanekanbanrelation_params
      params.require(:lanekanbanrelation).permit(:lane_id, :kanban_id)
   end
end
