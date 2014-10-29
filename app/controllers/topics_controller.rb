class TopicsController < ApplicationController

  before_action :set_topic, :only => [:edit, :destroy, :update, :show]
  before_action :authenticate_user!


  def index
    @topics = Topic.includes(:user).page(params[:page]).per(7)
  end

  def new
    @topic = Topic.new()
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    @topic.save

    redirect_to topics_path
  end

  def edit
  end

  def show
    @replies = Reply.includes(:user).page(params[:page]).per(10)
  end

  def update
    @topic.update(topic_params)
    if @topic.save
      redirect_to topic_path
    else
      render :action => :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :content)
  end

end
