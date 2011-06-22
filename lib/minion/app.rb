module Minion
  class App
    
    def initialize(output=STDOUT)
      @output = output
    end
    
    def start
      @output.puts "Success welcome to the minion app"
    end
    
  end
end