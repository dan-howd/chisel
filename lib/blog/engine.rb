module Blog
  class Engine < ::Rails::Engine
    isolate_namespace Blog

    require 'rubygems'
    require 'kaminari'

    if !Rails.env.production?
      require 'pry'
    end
  end
end
