class CalculationsController < ApplicationController
 before_action :authenticate_user!  
    def new
      @calculation = Calculation.new
    end
  
    def show
      @calculation = Calculation.find_by(id: params[:id])
    end
  
    def create
      @calculation = Calculation.new(calculation_params)
      params[:calculation][:question] ? @calculation.question = params[:calculation][:question] : false
      if @calculation.save
          flash[:notice] = "診断が完了しました"
          redirect_to calculation_path(@calculation.id)
      else
          redirect_to :action => "new"
      end
    end
  
  private
    def calculation_params
        params.require(:calculation).permit(:id, question: [])
    end

end
