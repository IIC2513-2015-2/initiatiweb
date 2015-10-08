class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :first_name, :last_name, :password)
    @user = User.new(user_params)
    if @user.save
      flash.notice = 'Cuenta creada exitosamente'
      redirect_to root_path
    else
      render :new
    end
  end
end
