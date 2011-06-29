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
require 'rubygems/package_task'

$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
$LOAD_PATH << File.join(File.dirname(__FILE__))

# load custom tasks
Dir.glob("lib/**/*.rake").each do |f|
  Kernel.load f
end

require 'minion/version'

spec = Gem::Specification.new do |s|
  s.name        = "minion"
  s.version     = Minion::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ben Emson"]
  s.email       = ["ben@emson.co.uk"]
  s.homepage    = "https://github.com/emson"
  s.summary     = %q{Minion is a Ruby framework for building mini apps.}
  s.description = %q{Minion provides a framework for building simple apps based on discreet services.}
  
  s.required_rubygems_version = ">= 1.3.6"
  s.bindir = 'bin'
  s.executables = ['minion']
  s.add_dependency("thor", ">= 0.14.6")
  
  require 'rake'
  s.files = FileList['lib/**/*.rb', 'config/**/*', 'bin/*', '[A-Z]*'].to_a
  
  s.add_development_dependency "rspec"
  s.add_development_dependency "cucumber"
  s.test_files         = `git ls-files -- {spec,features}/*`.split("\n")
end

Gem::PackageTask.new(spec) do |pkg|
   pkg.need_zip = true
   pkg.need_tar = true
 end


# Rake::GemPackageTask.new(spec) do |pkg|
#    pkg.need_zip = true
#    pkg.need_tar = true
#  end
