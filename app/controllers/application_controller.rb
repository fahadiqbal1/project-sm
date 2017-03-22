class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_locale
  before_action :configure_permitted_parameters, :if => :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery :with => :exception
  before_action :set_paper_trail_whodunnit
  before_action :check_for_consent

  add_breadcrumb "Home", :root_path

  def user_for_paper_trail
    admin_signed_in? ? current_admin.email : "Public user"
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { :locale => I18n.locale }
  end

  protected

  # Allow extra keys to be added to the User model
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:email, :language_ids]) # rubocop:disable Metrics/LineLength
  end

  # Show a message for logged in users
  def check_for_consent # rubocop:disable Metrics/AbcSize
    return unless user_signed_in?
    flash[:alert] = I18n.t "user_preference.not_contsented_yet" if current_user.user_preference.consent == false # rubocop:disable Metrics/LineLength
    flash[:info] = I18n.t "user_preference.no_course_selected" if current_user.user_courses.empty? # rubocop:disable Metrics/LineLength
    flash[:info] = I18n.t "user_preference.no_language_selected" if current_user.user_languages.empty? # rubocop:disable Metrics/LineLength
  end
end
