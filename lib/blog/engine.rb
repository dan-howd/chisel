module Blog
  class Engine < ::Rails::Engine
    isolate_namespace Blog

    require 'rubygems'
    require 'kaminari'
    require 'jquery-rails'
    require 'asciidoctor'
  end
end
