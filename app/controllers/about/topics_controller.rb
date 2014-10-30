class About::TopicsController < ApplicationController
  before_action :authenticate_user!
  layout "about"
  def index
    @users = User.all
    @topics = Topic.all
    @replies = Reply.all
  end
end
