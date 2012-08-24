require 'rake/testtask'

namespace :test do
  Rake::TestTask.new(:run) do |t|
    t.libs = ['lib']
    t.test_files = FileList['test/**/*_test.rb']
    t.ruby_opts += ["-w"]
  end
end

desc 'Run unit tests'
task :test => ['test:run']
