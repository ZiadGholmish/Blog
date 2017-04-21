class CategoriesController < ApplicationController

  before_action :require_admin_user, except: [:index, :show]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "Category was created successfully"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def show
  end

  def index

    @categories = Category.paginate(page: params[:page], per_page: 2)
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end


  def require_admin_user
    if !logged_in? || (logged_in? and !@current_user.admin?)
      flash[:danger] = "Only admins can perform that action"
      redirect_to categories_path
    end
  end

end