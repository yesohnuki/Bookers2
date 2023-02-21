class UsersController < ApplicationController

 def show
  @user = User.find(params[:id])
  @book = Book.new
 end

 def update
 end

 def edit
  @user = User.find(params[:id])
 end

 def index
  @users = User.all
  @book = Book.new
  @user = current_user
 end

 private
  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)

  end

end
