class SessionsController < ApplicationController
  def new

  end

  def create
    email = params[:session][:email]
    password = params[:session][:password]
    user = User.find_by(email: email)
    if user.try(:authenticate, password)
      session[:user_id] = user.id
      redirect_to localized_root_path, notice: 'Sesión iniciada exitosamente'
    else
      flash.alert = 'Usuario o contraseña incorrectos'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to localized_root_path, notice: 'Sesión terminada exitosamente'
  end
end
