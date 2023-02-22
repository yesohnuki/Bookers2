class BooksController < ApplicationController

 def show
  @book = Book.find(params[:id])
  @user = @book.user
  @book_new = Book.new
 end

 def edit
  @book = Book.find(params[:id])
 end

 def update
    @book = Book.find(params[:id])
  if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book)
  else
    render "edit"
  end
 end

 def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  if @book.save
   flash[:notice] = "You have created book successfully."
   redirect_to book_path(@book.id)
  else
   @books = Book.all
   @user = current_user
   render :index


  end
 end

 def index
   @books = Book.all
   @book = Book.new
   @user = current_user
 end

 def destroy
  book = Book.find(params[:id])  # データ（レコード）を1件取得
  book.destroy  # データ（レコード）を削除
  redirect_to '/books'  # 投稿一覧画面へリダイレクト
 end

 private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end