class BooksController < ApplicationController

 def show
  @book = Book.find(params[:id])
  @user = @book.user
  @book_new = Book.new
 end

 def edit
  @book = Book.find(params[:id])
 end

 def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  if @book.save
   flash[:notice] = "You have created book successfully."
  redirect_to book_path(@book.id)
  end
 end

 def index
   @books = Book.all
   @book = Book.new
   @user = current_user
 end

 def destroy

 end

 private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end