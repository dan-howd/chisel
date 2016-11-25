module Blog
  class Admin::ApplicationController < ActionController::Base
    layout "blog/admin"

    force_ssl if: :ssl_configured?
    protect_from_forgery with: :exception

    # Require authentication if in host application and devise is present.
    #
    # Otherwise authentication not required in testing environment.
    before_filter :authenticate_user! if defined? authenticate_user!

    def ssl_configured?
      Rails.env.production?
    end
  end
end
