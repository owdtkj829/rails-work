class BooksController < ApplicationController
	def show
		@user = User.find(params[:id])
    	@book = Book.all
    	@book = Book.new
	end
	def new
		@book = Book.new
    end
    def index
    	@user = User.find(params[:id])
    	@book = Book.all
    	@book = Book.new
    end
    def create
        @book = Book.new(book_params)
    	@book.user_id = current_user.id
    	@book.save
        redirect_to book_path(@book.id)
    end

    private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
