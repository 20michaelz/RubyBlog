class ApplicationController < ActionController::Base
    # required to run before any other action is taken
    # force user to welcome page unless logged in
    before_action :authorized
    # makes these methods accessible in the view
    helper_method :current_user
    helper_method :logged_in?

    # current_user is the user with matching session id
    def current_user
        User.find_by(id: session[:user_id])  
    end

    # check if user is logged in
    def logged_in? 
        !current_user.nil?  
    end

    def authorized
        redirect_to '/welcome' unless logged_in?
    end

end
