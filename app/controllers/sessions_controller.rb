class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      flash[:notice] = "Welcome back, #{@user.name}"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = "Invalid username or password"
      redirect_to login_path
    end
  end

  def destroy
    flash[:notice] = "Logged out"
    session.delete(:user_id)
    redirect_to root_path
  end
end
