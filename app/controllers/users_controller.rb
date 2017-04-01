class UsersController < ApplicationController


  #add before action to set the user before these three methods so we can avoid code duplicate
  before_action :set_user , only: [:edit , :show , :update]
  before_action :require_user , only: [:edit , :update , :destroy]
  before_action :require_same_user , only: [:edit , :update , :destroy]


  def index
    @users = User.paginate(page: params[:page] , per_page: 2)
  end

  def new
    @user = User.new
  end


  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 1)
  end


  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Ziad Blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end


  def update
    if @user.update(users_params)
      flash[:success] = "This user updated successfully #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end

  end

  def users_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if(current_user != @user)
      flash[:danger] = "You are not authorized to access this page"
      redirect_to users_path
    end
  end

end