class TopicsController < ApplicationController

  before_action :set_topic, :only => [:edit, :destroy, :update, :show]

  def index
    @topics = Topic.page(params[:page]).per(7)
  end

  def new
    @topic = Topic.new()
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.save

    redirect_to topics_path
  end

  def edit
  end

  def show

  end

  def update
    @topic.save
    redirect_to topic_path
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
