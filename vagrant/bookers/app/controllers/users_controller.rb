class UsersController < ApplicationController
    def show
        @users =User.all
        @book = Book.new
        if current_user.id.==params[:id]
            @user = current_user
            @books = current_user.books
        else
            @user = User.find(params[:id])
            @books = User.find(params[:id]).books
        end
    end

	def edit
     @user = current_user
    end

    def update
        @user = current_user
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
end