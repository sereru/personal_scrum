class LanesController < ApplicationController
  def new
    @lane = Lane.new
    @max = Lane.count - 1
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

  def destroy
    @lane = Lane.find(params[:id])
    st = @lane.stage
    changelanes = Lane.where("? < stage", st-1)
    changelanes.each do |clane|
      clane.stage -= 1
      clane.save
    end
    @lane.destroy
    redirect_back fallback_location: root_url
  end

  private

    def lane_params
      params.require(:lane).permit(:stage, :name)
    end
end
