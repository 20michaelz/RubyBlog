class UsersController < ApplicationController

  # allows user to access new and create without logging in
  skip_before_action :authorized, only: [:new, :create]


  def new
    @user = User.new
  end


  # create new user, set session to current user_id and then redirect to welcome page
  def create
    @user = User.create(params.require(:user).permit(:username, :password))
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end
end
