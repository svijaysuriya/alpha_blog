class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        ## memoisation( i.e if we have the current user then we can directly return it! )when we just have the second part everytime we will hit the DB unnecessarily!
    end

    def logged_in?
        !!current_user
    end
end
