class ApplicationController < ActionController::Base
  include Authorization

  before_action :set_locale

  def default_url_options
    { lang: I18n.locale }
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path(lang: params[:lang]), alert: t('devise.failure.unauthenticated')
    end
  end
end
