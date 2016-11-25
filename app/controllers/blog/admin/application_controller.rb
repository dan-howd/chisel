module Blog
  class Admin::ApplicationController < ActionController::Base
    layout "blog/admin"

    force_ssl if: :ssl_configured?
    protect_from_forgery with: :exception

    def ssl_configured?
      Rails.env.production?
    end
  end
end
