class About::TopicsController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
    @topics = Topic.all
    @replies = Reply.all
  end
end
