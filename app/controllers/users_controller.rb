class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :first_name, :last_name, :password)
    @user = User.create(user_params)
    redirect_to root_path
  end
end
