require "rubygems"
require "rspec"
require "rspec/core"
require 'rspec/core/rake_task'

Dir.glob("lib/**/*.rb").each do |file|
  require File.expand_path(file)
end


def clean_up_tests
  path = File.expand_path(File.join(Minion::ROOT, 'tmp_rspec'))
  FileUtils.rm_rf(path)
end