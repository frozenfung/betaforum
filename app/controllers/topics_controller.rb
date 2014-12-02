class TopicsController < ApplicationController

  before_action :set_topic, :only => [:show]
  before_action :set_my_topic, :only => [:edit, :destroy, :update]

  before_action :authenticate_user!

  def index
    # apply condition group
    if params[:gid]
      @group = Group.find(params[:gid])
      @topics = @group.topics
    else
      @topics = Topic.all # lazy query
    end

    # apply condition order
    if params[:order]
      sort = (params[:order] == 'most') ? 'reply_count DESC' : 'updated_at DESC'
      @topics = @topics.includes(:user).order(sort).page(params[:page]).per(7)
    else
      @topics = @topics.includes(:user).page(params[:page]).per(7)
    end
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    if @topic.save
      redirect_to topics_path
    else
      flash[:blank_field] = 'Title and Content can not be blank!'
      render :action => :new
    end
  end

  def edit
  end

  def show
    @replies = Reply.includes(:user).page(params[:page]).per(10)
  end

  def update
    if @topic.update(topic_params)
      redirect_to topic_path
    else
      render :action => :edit
    end
  end

  def destroy
    @topic.destroy

    redirect_to topics_path
  end

  protected
  
  def set_topic
    @topic = Topic.find(params[:id])
  end

  def set_my_topic
    @topic = current_user.topics.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :content, :group_ids => [])
  end

end
