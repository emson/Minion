module Minion
  
  ROOT = File.expand_path(File.join(File.dirname(__FILE__), '../../'))
  MINIONS = 'minions'
  
  class Application
    
    # @root = File.expand_path(File.join(File.dirname(__FILE__), '../../', 'minions'))
    @minions_root = File.join(ROOT, MINIONS)
    
    class << self
      attr_reader :minions_root
      
      def minions_root=(path)
        @minions_root = path unless path.nil? || path == ''
        @minions_root = File.join(ROOT, MINIONS) if path.nil? || path == ''
      end
    end
    
  end
end