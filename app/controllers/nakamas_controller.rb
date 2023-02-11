class NakamasController < ApplicationController
 before_action :authenticate_user! 
    def new
      @nakama = Nakama.new
    end
      
    def show
      @nakama = Nakama.find_by(id: params[:id])
    end
      
    def create
      @nakama = Nakama.new(nakama_params)
      params[:nakama][:question] ? @nakama.question = params[:nakama][:question] : false
      if @nakama.save
          flash[:notice] = "診断が完了しました"
          redirect_to nakama_path(@nakama.id)
      else
          redirect_to :action => "new"
      end
    end
      
  private
    def nakama_params
        params.require(:nakama).permit(:id, question: [])
    end
end
