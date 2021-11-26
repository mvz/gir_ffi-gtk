# frozen_string_literal: true

require "bundler/gem_helper"
require "rake/clean"
require "rake/manifest/task"

Bundler::GemHelper.install_tasks

load "tasks/test.rake"

Rake::Manifest::Task.new do |t|
  t.patterns = ["lib/**/*.rb", "*.md", "COPYING.LIB"]
end

task build: "manifest:check"

task default: [:test, "manifest:check"]
