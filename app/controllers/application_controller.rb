class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  #after_filter works in Rails 3, is now becoming deprecated in favour of acter_action
  after_action :set_access_controller_headers


  private

  #gets around browser issue that blocks JSON from external URL
  def set_access_controller_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
  end

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
