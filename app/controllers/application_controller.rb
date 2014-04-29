class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale


  private

  #helps prevent cluttering the controller with instance variables
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  #allows the view folders to access this method
  helper_method :current_user

  def authenticate_user!
    redirect_to root_path, alert: "You need to sign in" if current_user.nil?
  end

  def set_locale
    #internationalization
    I18n.locale = params[:locale] if params[:locale].present?
  end


  def default_url_options(options={})
    {locale: I18n.locale}
  end
end
