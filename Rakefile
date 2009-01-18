require 'spec/rake/spectask'

desc "Run Specs with Rspec"
Spec::Rake::SpecTask.new :spec do |t|
  t.spec_opts = %w(--format specdoc --color)
  t.spec_files = FileList['spec/*_spec.rb']
end

$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'cucumber/rake/task'
Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = "--format pretty --no-source"
end
