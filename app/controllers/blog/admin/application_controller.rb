module Blog
  class Admin::ApplicationController < ActionController::Base
    layout "application"

    force_ssl if: :ssl_configured?
    protect_from_forgery with: :exception

    # Very important!
    if !Rails.env.test?
      before_filter :authenticate_user!
    end

    def ssl_configured?
      Rails.env.production?
    end
  end
end
