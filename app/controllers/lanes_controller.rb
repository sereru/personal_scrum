class LanesController < ApplicationController
  def new
    @lane = Lane.new
    @lanes = Lane.order(:stage)
  end

  def create
    @lane = Lane.new(lane_params)
    st = @lane.stage
    allcnt = Lane.count
    if @lane.stage < allcnt
      changelanes = Lane.where("? < stage", st-1)
    end
    if @lane.save
      changelanes.each do |clane|
        clane.stage += 1
        clane.save
      end
      llane = Lane.last 
      llane.stage -= 1
      llane.save
      redirect_to root_path
    else 
      redirect_to 'tags/new'

    end
  end

  private

    def lane_params
      params.require(:lane).permit(:stage, :name)
    end
end
