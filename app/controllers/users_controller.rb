class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password))

    if @user.save
      flash[:notice] = "Welcome, #{@user.name}"
      redirect_to root_path
    else
      render :new
    end
  end
end
