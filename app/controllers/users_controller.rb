class UsersController < ApplicationController
    before_action :set_user, only: [:show,:edit,:update, :destroy]
    before_action :require_user, only: [ :edit, :update]
    before_action :require_same_user , only: [:edit,:update,:destroy]
    def show
        
        @articles = @user.articles.paginate(page: params[:page], per_page:5)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if(@user.save)
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to Alphablog , #{@user.username}"
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "Your Profile is successfully updated!"
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end

    def index
        @users = User.paginate(page: params[:page], per_page:5)
    end

    def destroy
        @user.destroy
        session[:user_id]=nil if @user == current_user
        flash[:notice] = " Account and its associated articles are all deleted!"
        redirect_to root_path, status: :see_other
    end

    private
    def user_params
        params.require(:user).permit(:username,:email,:password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user && !current_user.admin?
          flash[:alert] = "you can only edit or delete your own profile :)"
          redirect_to @user
        end
      end
end
