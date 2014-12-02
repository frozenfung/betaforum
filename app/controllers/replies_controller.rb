class RepliesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_topic

  def create    
    @topic.reply_count += 1
    @topic.save

    @reply = @topic.replies.build(reply_params)
    @reply.user = current_user
    if @reply.save
      redirect_to topic_path(@topic)
    else
      #flash[:no_comment] = 'You can not comment without comment!'
      #redirect_to topic_path(@topic)

      render "/topics/show"
    end
  end

  protected

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def reply_params
    params.require(:reply).permit(:content)
  end

end
