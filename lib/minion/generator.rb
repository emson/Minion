require 'active_support/inflector'

module Minion
  class Generator
    
    class << self
      def mkdir(path, *dir_names)
        dir_path = File.expand_path(path)
        dir_path = File.join(dir_path, dir_names) if dir_names
        FileUtils.mkdir_p(dir_path)
        dir_path
      end
      
      def touch(path, filename, content)
        mkdir(path) unless File.exists?(path)
        file_path = File.join(path, filename)
        unless File.exists?(file_path) 
          File.open(file_path, 'w') {|f| f.write(content) }
        end
        file_path
      end
      
      
      def service_content(name)
"
module Services
  class #{name.camelize}
    # TODO add methods
  end
end

"
      end
      
      
      def service_spec_content(name)
"require 'spec_helper'

module Services
  describe #{name.camelize} do
    it \"should do something\" do
      raise \"Please implement spec: spec/services/#{name}/#{name}_spec.rb\"
    end
  end
end

"
      end
      
    end
    
  end
end