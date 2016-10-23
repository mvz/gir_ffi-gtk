source 'http://rubygems.org'

# The gem's dependencies are specified in gir_ffi.gemspec
gemspec

gem 'rubocop', '~> 0.44.1', group: :development

unless ENV['CI']
  gem 'pry', require: false
  gem 'simplecov', require: false if RUBY_ENGINE == 'ruby'
end
