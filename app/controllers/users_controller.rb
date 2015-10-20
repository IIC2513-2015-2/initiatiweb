class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
    @user = UserManager.create(user_params)
    if @user.persisted?
      flash.notice = 'Cuenta creada exitosamente'
      redirect_to localized_root_path
    else
      render :new
    end
  end

  def validate
    user = User.find_by(validation_token: params[:token])
    if user
      user.update(validation_token: nil)
      redirect_to new_session_path, notice: 'Cuenta validada exitosamente'
    else
      redirect_to localized_root_path, alert: 'Link de validación incorrecto'
    end
  end
end
