class NazosController < ApplicationController
 before_action :authenticate_user! 
    def new
      @nazo = Nazo.new
    end
      
    def show
      @nazo = Nazo.find_by(id: params[:id])
    end
      
    def create
      @nazo = Nazo.new(nazo_params)
      params[:nazo][:question] ? @nazo.question = params[:nazo][:question] : false
      if @nazo.save
          flash[:notice] = "診断が完了しました"
          redirect_to nazo_path(@nazo.id)
      else
          redirect_to :action => "new"
      end
    end
      
  private
    def nazo_params
        params.require(:nazo).permit(:id, question: [])
    end
end
