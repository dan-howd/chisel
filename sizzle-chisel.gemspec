$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "blog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sizzle-chisel"
  s.version     = Blog::VERSION
  s.authors     = ["Blaine Lafreniere"]
  s.email       = ["brlafreniere@gmail.com"]
  s.homepage    = ""
  s.summary     = ""
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.6"
  s.add_dependency "kaminari"
  s.add_dependency "sass-rails"
  s.add_dependency "jquery-rails"
  s.add_dependency "minitest-reporters"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "pry"
end
