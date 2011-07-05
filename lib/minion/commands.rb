
module Minion
  class Commands
    
    attr_reader :output
    
    def initialize(output=STDOUT)
      @output = output
    end
    
    def init
      minions_root = Minion::Application.minions_root
      Generator.mkdir(minions_root)
      Generator.mkdir(File.join(minions_root, "spec"))
      output.puts "The minions have a new home: #{minions_root}"
    end
    
    def add(app)
      if init_check?
        minions_root = Minion::Application.minions_root
        app_dir = Generator.mkdir(minions_root, app)
        spec_app_dir = Generator.mkdir(File.join(minions_root, "spec"), app)
        File.open(File.join(app_dir, "#{app}.rb"), 'w') { |f| f.write Minion::Generator.minion_content(app)}
        File.open(File.join(spec_app_dir, "#{app}_spec.rb"), 'w') { |f| f.write Minion::Generator.minion_spec_content(app)}
        output.puts "Minion '#{app}' at your service master"
      end
    end
    
    def list
      if init_check?
        Dir.foreach(Minion::Application.minions_root) do |dir|
          output.puts dir unless File.directory? dir
        end
      end
    end
    
    private
    
    def init_check?
      unless File.exists?(Minion::Application.minions_root)
        output.puts "Please run 'minion init' first"
        return false
      end
      true
    end
    
  end
end