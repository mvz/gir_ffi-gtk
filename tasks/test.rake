# frozen_string_literal: true

require "rake/testtask"

namespace :test do
  Rake::TestTask.new(:gtk3) do |t|
    t.libs << "test"
    t.test_files = FileList["test/**/*_test.rb"]
    t.ruby_opts += ["-rgir_ffi-gtk3"]
  end

  Rake::TestTask.new(:gtk2) do |t|
    t.libs << "test"
    t.test_files = FileList["test/**/*_test.rb"]
    t.ruby_opts += ["-rgir_ffi-gtk2"]
  end
end

desc "Run unit tests"
task test: ["test:gtk3", "test:gtk2"]
