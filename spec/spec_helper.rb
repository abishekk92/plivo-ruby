$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

#Turn config
Turn.config do |c|
 c.format  = :outline
 c.trace   = true
 c.natural = true
end
 
#VCR config
VCR.config do |c|
  c.cassette_library_dir = 'spec/fixtures/plivo_cassettes'
  c.stub_with :webmock
end

RSpec.configure do |config|
  
end
