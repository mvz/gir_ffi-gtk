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
    t.ruby_opts += ['-w', '-Itest']
  end

  task gtk2: :set_gtk_version_2

  task :set_gtk_version_2 do
    ENV['GTK_VERSION'] = '2'
  end
end

desc 'Run unit tests'
task test: ['test:gtk3', 'test:gtk2']
