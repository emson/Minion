require 'spec_helper'

module Minion
  
  describe Commands do
    let(:output) { double('output').as_null_object }
    let(:commands) { Commands.new(output) }
    let(:minions_path) { Minion::Application.minions_root }
    before :all do
      Minion::Application.minions_root = File.join(Minion::ROOT, 'tmp_rspec/minions')
      clean_up_tests
    end
    after :all do
      clean_up_tests
    end
    
    describe "before #init" do
      it "should show an error message if 'add' is called before 'init'" do
        output.should_receive(:puts).with("Please run 'minion init' first")
        commands.add "my_app"
      end
      
      it "should show an error message if 'list' is called before 'init'" do
        File.should_receive(:exists?).with(anything).and_return false
        output.should_receive(:puts).with("Please run 'minion init' first")
        commands.list
      end
    end
    
    describe "after #init" do
      it "should make a minions directory" do
        output.should_receive(:puts).with("The minions have a new home: #{minions_path}")
        commands.init
        File.exists?(minions_path).should be_true
      end
      
      describe "then #add" do
        it "should display a created message" do
          output.should_receive(:puts).with("Minion 'my_app' at your service master")
          commands.add "my_app"
        end
      
        it "should create an app subdirectory under the minions directory" do
          commands.add "my_app"
          File.exists?(File.join(minions_path, "my_app")).should be_true
        end
      
        it "should create an [app]_main.rb file in the app directory" do
          commands.add "my_app"
          File.exists?(File.join(minions_path, "my_app", "my_app_main.rb")).should be_true
        end
      end
    
      describe "then #list" do
        it "should return a list of the apps in the minions directory" do
          commands.add "my_app_1"
          commands.add "my_app_2"
          commands.list
          Dir.entries(minions_path) =~ ['my_app_1', 'my_app_2']
        end
      end
      
    end
  end
end