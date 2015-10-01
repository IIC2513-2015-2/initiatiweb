class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  # TODO: reemplazar por usuario con sesión iniciada o nil
  def current_user
    @current_user ||= User.first
  end
end
