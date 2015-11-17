require 'rake/testtask'

namespace :test do
  Rake::TestTask.new(:gtk3) do |t|
    t.libs = ['lib']
    t.test_files = FileList['test/**/*_test.rb']
    t.ruby_opts += ['-w', '-Itest']
  end

  Rake::TestTask.new(:gtk2) do |t|
    t.libs = ['lib']
    t.test_files = FileList['test/**/*_test.rb']
    t.ruby_opts += ['-rgir_ffi-gtk2', '-w', '-Itest']
  end
end

desc 'Run unit tests'
task test: ['test:gtk3', 'test:gtk2']
