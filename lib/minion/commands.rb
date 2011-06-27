require 'fileutils'

module Minion
  class Commands
    
    def initialize(output=STDOUT)
      @output = output
    end
    
    def init
      output.puts "The minions have a new home"
      FileUtils.mkdir_p(Minion::MINIONS_PATH)
    end
    
    def add(app)
      if init_check?
        FileUtils.mkdir("#{Minion::MINIONS_PATH}/#{app}")
        output.puts "Minion '#{app}' at your service master"
      end
    end
    
    private
    
    def init_check?
      unless File.exists?(Minion::MINIONS_PATH)
        output.puts "Please run 'minion init' first"
        return false
      end
      true
    end
    
    def output
      @output
    end
    
  end
end