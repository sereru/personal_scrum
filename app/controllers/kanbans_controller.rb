class KanbansController < ApplicationController
  def new
    @kanban = Kanban.new
  end

  def create
    @kanban = Kanban.new(kanban_params)
    if @kanban.save
      flash[:success] = "看板登録"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

   def kanban_params
      params.require(:kanban).permit(:content, :stage, :deadline)
   end
end
