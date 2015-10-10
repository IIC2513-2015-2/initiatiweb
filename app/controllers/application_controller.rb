class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  helper_method :current_user

  def current_user
    return @current_user if defined? @current_user
    @current_user = User.find(session[:user_id]) if session.key?(:user_id)
  end

  def default_url_options(options = {})
    I18n.locale == I18n.default_locale ? options : { locale: I18n.locale }.merge(options)
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
