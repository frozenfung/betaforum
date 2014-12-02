class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @topics = @user.topics.all
    @replies = @user.replies.all
  end

end
