
module Minion
  class Generator
    
    class << self
      def mkdir(path, *dir_names)
        dir_path = File.expand_path(path)
        dir_path = File.join(dir_path, dir_names) if dir_names
        FileUtils.mkdir_p(dir_path)
      end
    end
    
  end
end