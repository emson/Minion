module Minion
  class Commands
    
    def initialize(output=STDOUT)
      @output = output
    end
    
    def add(app)
      puts "Adding application #{app}"
    end
    
    def start
      @output.puts "Success welcome to the minion app"
    end
    
  end
end