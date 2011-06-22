# Used by Cucumber to load the main application file found in the lib dir... 
# in this case it requires lib/minion.rb
# This file also tells Cucumber that it's features are written in Ruby.

$LOAD_PATH << File.expand_path('../../../lib', __FILE__)
require 'minion'