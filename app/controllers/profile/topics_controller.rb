class Profile::TopicsController < ApplicationController
  before_action :authenticate_user!
  layout "profile"
  def index
    @user = current_user
    @topics = @user.topics.all
    @replies = @user.replies.all
  end
end
