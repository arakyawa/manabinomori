class KeysController < ApplicationController
 before_action :authenticate_user! 
    def new
      @key = Key.new
    end
  
    def show
      @key = Key.find_by(id: params[:id])
    end
  
    def create
      @key = Key.new(key_params)
      params[:key][:question] ? @key.question = params[:key][:question] : false
      if @key.save
          flash[:notice] = "診断が完了しました"
          redirect_to key_path(@key.id)
      else
          redirect_to :action => "new"
      end
    end
  
  private
    def key_params
        params.require(:key).permit(:id, question: [])
    end
end
