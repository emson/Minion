# Used by Cucumber to load the main application file found in the lib dir... 
# in this case it requires lib/minion.rb
# This file also tells Cucumber that it's features are written in Ruby.

require 'cucumber/rspec/doubles'

$LOAD_PATH << File.expand_path('../../../lib', __FILE__)
require 'minion'


# overrde the minions path for testing
module Minion
  MINIONS_PATH = File.expand_path("tmp/minions")
end

# Use the Ruby at_exit hook to clean up the tmp dir
at_exit do
  FileUtils.rm_rf('tmp') if File.exists?('tmp')
end