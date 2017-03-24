class SessionsController < ApplicationController

  def new

  end

  def create

    #find the user pay email
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])

      #save the user id in the session
      session[:user_id] = user.id
      flash[:success] = "Welcome Back #{params[:session][:email]}"
      redirect_to user_path(user)

    else

      flash.now[:danger] = "Error  #{params[:session][:email]}"
      render 'new'

    end

  end

  def destroy
    session[:user_id] =  nil
    redirect_to articles_path
  end

end
