# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "plivo-ruby"
  gem.homepage = "http://github.com/abishekk92/plivo"
  gem.license = "MIT"
  gem.summary = %Q{API Wrapper to interact with Plivo Cloud, exposes the endpoints as ruby methods}
  gem.description = %Q{API Wrapper to interact with Plivo Cloud}
  gem.email = "bhat.abishek@gmail.com"
  gem.authors = ["Abishek Bhat"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "plivo #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'rake/testtask' 
Rake::TestTask.new do |t|
    t.test_files = FileList['spec/lib/plivo/*_spec.rb']
    t.verbose = true
end

task :defalult => :test
