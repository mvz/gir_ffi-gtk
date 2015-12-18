source 'http://rubygems.org'

# The gem's dependencies are specified in gir_ffi.gemspec
gemspec

gem 'gir_ffi', git: 'https://github.com/mvz/gir_ffi.git'

unless ENV['CI']
  gem 'pry', require: false
  gem 'simplecov', require: false if RUBY_ENGINE == 'ruby'
end
