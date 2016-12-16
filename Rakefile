require 'bundler/gem_helper'
require 'rake/clean'
require 'rubocop/rake_task'

Bundler::GemHelper.install_tasks
RuboCop::RakeTask.new

load 'tasks/test.rake'

task default: :test
task default: :rubocop unless RUBY_ENGINE == 'rbx'
