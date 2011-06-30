
module Minion
  class Commands
    
    attr_reader :output
    
    def initialize(output=STDOUT)
      @output = output
    end
    
    def init
      output.puts "The minions have a new home"
      Generator.mkdir(Minion::Application.minions_root)
    end
    
    def add(app)
      if init_check?
        app_dir = Generator.mkdir(Minion::Application.minions_root, app)
        File.open(File.join(app_dir, "#{app}_main.rb"), 'w') { |f| f.write "puts \"hello I\'m a #{app} minion\""}
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