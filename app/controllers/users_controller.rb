class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      flash[:success] = "Welcome to the Ziad Blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def users_params
    params.require(:user).permit(:username, :email, :password)
  end
end