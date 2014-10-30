class RepliesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_topic

  def create    
    @topic.reply_count += 1
    @topic.save

    @reply = @topic.replies.build(reply_params)
    @reply.user = current_user
    @reply.save

    redirect_to topic_path(@topic)
  end

  protected

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def reply_params
    params.require(:reply).permit(:content)
  end

end
