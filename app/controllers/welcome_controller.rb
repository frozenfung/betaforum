class WelcomeController < ApplicationController

  before_action :authenticate_user!
  
  def about
    @users = User.all
    @topics = Topic.all
    @replies = Reply.all
  end

end
