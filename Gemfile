# frozen_string_literal: true

source "https://rubygems.org"

# The gem's dependencies are specified in gir_ffi.gemspec
gemspec

unless ENV["CI"]
  gem "pry", require: false
  gem "simplecov", require: false if RUBY_ENGINE == "ruby"
end
