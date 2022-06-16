class SessionsController < ApplicationController
    def new

    end

    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id]=user.id
            flash[:notice]="logged in successfully :)"
            redirect_to user
        else
            flash.now[:alert] = "login in details incorrect :(" 
            render 'new'
            # flash will hold for one http request cycle so when we render a page we wonn't have a request response cycle so we must flash the msg immediately!
    
        end
    end
    def destroy
        if session[:user_id]
            session[:user_id]=nil
            flash[:notice] = "logged out successfully :)"
            redirect_to root_path, status: :see_other
        else
            flash[:notice] = "you are not logged in :)"
            redirect_to login_path , status: :see_other
        end
    end
end