class RoadsController < ApplicationController
 before_action :authenticate_user! 
    def new
      @road = Road.new
    end
      
    def show
      @road = Road.find_by(id: params[:id])
    end
      
    def create
      @road = Road.new(road_params)
      params[:road][:question] ? @road.question = params[:road][:question] : false
      if @road.save
          flash[:notice] = "診断が完了しました"
          redirect_to road_path(@road.id)
      else
          redirect_to :action => "new"
      end
    end
      
  private
    def road_params
        params.require(:road).permit(:id, question: [])
    end
end
