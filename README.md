# sizzle-chisel

Add some sizzle to your chisel.

This gem is a plugin that adds very basic blogging functionality to your rails
application.

To install, put in your Gemfile:

```ruby
gem 'sizzle-chisel', git: 'https://github.com/brlafreniere/sizzle-chisel.git'
```

Run `bundle install`

Copy the migrations by running `rake railties:migrations:install`

Then run `rake db:migrate`

And you should be good to go.

Use `rake routes` to look at the routes the gem provides.
