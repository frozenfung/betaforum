class ReplysController < ApplicationController
  def create
    @reply = Reply.new(reply_params)
    @reply.save

    redirect_to topic_path(@topic)
  end

  def show
    
  end


  def reply_params
    params.require(:reply).permit(:content)
  end
end
