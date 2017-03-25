module Blog
  class ApplicationController < ActionController::Base
    layout "application"
    protect_from_forgery with: :exception

    unless Rails.env.test?
      before_filter :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
    end
  end
end
