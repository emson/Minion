require 'spec_helper'

def clean_up
  FileUtils.rm_rf("./tmp_rspec") if File.exists? "./tmp_rspec"
end

module Minion
  
  MINIONS_PATH = File.expand_path "./tmp_rspec/minions"
  
  describe Commands do
    after(:all) do
      clean_up
    end
    let(:output) { double('output').as_null_object }
    let(:commands) { Commands.new(output) }
    let(:minions_path) { Minion::MINIONS_PATH }
    
    describe "before #init" do
      it "should show an error message if 'add' is called before 'init'" do
        clean_up
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
        output.should_receive(:puts).with('The minions have a new home')
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
          File.exists?("#{minions_path}/my_app").should be_true
        end
      
        it "should create an [app]_main.rb file in the app directory" do
          commands.add "my_app"
          File.exists?("#{minions_path}/my_app/my_app_main.rb").should be_true
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