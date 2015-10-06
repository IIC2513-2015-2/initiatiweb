class SessionsController < ApplicationController
  def new

  end

  def create
    email = params[:session][:email]
    password = params[:session][:password]
    user = User.find_by(email: email, password: password)
    if user
      session[:user_id] = user.id
    else

    end
    redirect_to root_path
  end

  def destroy
  end
end
