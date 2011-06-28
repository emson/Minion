require 'spec_helper'

module Minion
  describe Commands do
    let(:output) { double('output').as_null_object }
    let(:commands) { Commands.new(output) }
    
    describe "#init" do
      it "should make a minions directory" do
        FileUtils.should_receive(:mkdir_p).with(Minion::MINIONS_PATH)
        output.should_receive(:puts).with('The minions have a new home')
        commands.init
      end
    end
    
    describe "#add" do
      it "should show an error message if 'add' is called before 'init'" do
        File.should_receive(:exists?).with(anything).and_return false
        output.should_receive(:puts).with("Please run 'minion init' first")
        commands.add "my_app"
      end
      
      it "should display a created message" do
        File.should_receive(:exists?).with(anything).and_return true
        FileUtils.stub(:mkdir_p).with(anything)
        output.should_receive(:puts).with("Minion 'my_app' at your service master")
        File.should_receive(:open).with("#{Minion::MINIONS_PATH}/my_app/my_app_main.rb", 'w')
        commands.add "my_app"
      end
      
      it "should create an app subdirectory under the minions directory" do
        File.should_receive(:exists?).with(anything).and_return true
        FileUtils.should_receive(:mkdir_p).with("#{Minion::MINIONS_PATH}/my_app")
        File.should_receive(:open).with("#{Minion::MINIONS_PATH}/my_app/my_app_main.rb", 'w')
        commands.add "my_app"
      end
      
      it "should create an [app]_main.rb file in the app directory" do
        File.should_receive(:exists?).with(anything).and_return true
        FileUtils.should_receive(:mkdir_p).with("#{Minion::MINIONS_PATH}/my_app")
        File.should_receive(:open).with("#{Minion::MINIONS_PATH}/my_app/my_app_main.rb", 'w')
        commands.add "my_app"
      end
      
    end
    
    describe "#list" do
      it "should show an error message if 'list' is called before 'init'" do
        File.should_receive(:exists?).with(anything).and_return false
        output.should_receive(:puts).with("Please run 'minion init' first")
        commands.list
      end
      
      it "should return a list of the apps in the minions directory" do
        File.stub(:exists?).with(anything).and_return true
        Dir.should_receive(:foreach).with Minion::MINIONS_PATH
        commands.list
      end
    end
  end
end