# require all the files in the minion folder,
# you may want to specify each require indvidually.
Dir[File.join(File.dirname(__FILE__), "minion/*.rb")].each do |file|
  require file
end



