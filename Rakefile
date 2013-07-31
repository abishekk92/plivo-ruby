# encoding: utf-8

require 'rubygems'
require 'bundler'
require 'rspec/core'
require 'rspec/core/rake_task'
require 'rake'
require 'rake/testtask'
require 'jeweler'
require 'rdoc/task'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end


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


RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "plivo #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Rake::TestTask.new do |t|
    t.test_files = FileList['spec/lib/plivo/*_spec.rb']
    t.verbose = true
end

task :defalult => :test
