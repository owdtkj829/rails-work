class UsersController < ApplicationController
    before_action :correct_user, only: [:edit, :update]
    skip_before_action:logged_in_user,only:[:new,:create]

    def show
        @book = Book.new
        @books = current_user.books
        @user = User.find(params[:id])
        @books = User.find(params[:id]).books
    end

	def edit
    end

    def update
        if  @user.update(user_params)
            flash[:notice] = "successfully"
            redirect_to user_path(params[:id])
        else
            flash.now[:alert] = "error"
            render :edit
        end
    end

    def index
    @user = current_user
    @users = User.all
    @book = Book.new
    end


    private
	def user_params
    	params.require(:user).permit(:name, :profile_image, :introduction)
	end
    
    def logged_in_user
      unless logged_in?
        redirect_to user_session_path
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to user_session_path unless @user == current_user
    end

end