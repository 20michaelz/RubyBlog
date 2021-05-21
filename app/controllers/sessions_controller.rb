class SessionsController < ApplicationController
  # allows sessions to authorize new/create/welcome without authenticating
  skip_before_action :authorized, only: [:new, :create, :welcome]
  
  def new
  end

  # verifies and creates a session
  def create
    @user = User.find_by(username: params[:username])

    # use bcrypt authenticate method to check password matches
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/welcome'
  end

  def page_requires_login
  end

  def login
  end

  def welcome
  end


end
