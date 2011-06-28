require 'fileutils'

module Minion
  class Commands
    
    attr_reader :output
    
    def initialize(output=STDOUT)
      @output = output
    end
    
    def init
      output.puts "The minions have a new home"
      FileUtils.mkdir_p(Minion::MINIONS_PATH)
    end
    
    def add(app)
      if init_check?
        FileUtils.mkdir_p("#{Minion::MINIONS_PATH}/#{app}")
        File.open("#{Minion::MINIONS_PATH}/#{app}/#{app}_main.rb", 'w') { |f| f.write "puts \"hello I\'m a #{app} minion\""}
        output.puts "Minion '#{app}' at your service master"
      end
    end
    
    def list
      if init_check?
        Dir.foreach(Minion::MINIONS_PATH) do |dir|
          output.puts dir unless File.directory? dir
        end
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
    
  end
end