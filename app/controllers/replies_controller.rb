class RepliesController < ApplicationController


  def create
    @topic = Topic.find(params[:topic_id])
    @topic.reply_count += 1  
    @topic.updated_at = Time.now
    @topic.save
    @reply = @topic.replies.build(reply_params)
    @reply.user = current_user
    @reply.save

    redirect_to topic_path(@topic)
  end

  def show

  end


  def reply_params
    params.require(:reply).permit(:content)
  end
end
