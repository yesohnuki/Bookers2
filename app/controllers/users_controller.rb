class UsersController < ApplicationController

 def show
 end

 def update
 end

 def edit
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
