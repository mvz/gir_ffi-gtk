source 'http://rubygems.org'

# The gem's dependencies are specified in gir_ffi.gemspec
gemspec

library_path = File.expand_path("../../gir_ffi", __FILE__)
if File.exist?(library_path)
  gem 'gir_ffi', path: library_path
else
  gem 'gir_ffi', git: 'https://github.com/mvz/gir_ffi.git'
end

unless ENV['CI']
  gem 'pry', require: false
  gem 'simplecov', require: false if RUBY_ENGINE == 'ruby'
end
