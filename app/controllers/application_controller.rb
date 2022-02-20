# frozen_string_literal: true

# application_controller
class ApplicationController < ActionController::Base
  def self.default_url_options
    { locale: I18n.locale }
  end

  around_action :switch_locale

  def switch_locale(&action)
    locale = locale_from_url || session[:locale] || I18n.default_locale
    I18n.with_locale locale, &action
  end

  def locale_from_url
    locale = params[:locale]

    return locale if I18n.available_locales.map(&:to_s).include?(locale)

    nil
  end
end
