require 'spec_helper'

module Minion
  describe Generator do
    
    after :each do
      clean_up_tests
    end
    
    context "#mkdir" do
      it "should generate the specified directory" do
        Generator.mkdir("tmp_rspec")
        File.exists?(File.join(Minion::ROOT, "tmp_rspec")).should be_true
      end
    
      it "should generate the specified directory based on a root" do
        Generator.mkdir(Minion::Application.minions_root, "test_example2")
        File.exists?(File.join(Minion::Application.minions_root, "test_example2")).should be_true
      end
    
      it "should generate the specified directory array path" do
        Generator.mkdir(Minion::Application.minions_root, "test_example2", "another")
        File.exists?(File.join(Minion::Application.minions_root, "test_example2", "another")).should be_true
      end
    
      it "should return a string file path" do
        path = Generator.mkdir("tmp_rspec")
        File.join(Minion::ROOT, "tmp_rspec").should == path.chop
      end
    end
    
    context "#touch" do
      it "should create a file with content" do
        Minion::Generator.touch(Minion::Application.minions_root, "some_file.rb", "stuff")
        File.exists?(File.join(Minion::Application.minions_root, "some_file.rb")).should be_true
      end
      
      it "should not create files if they already exist" do
        file_path = Minion::Generator.touch(Minion::Application.minions_root, "timed_file.rb", "GOOD")
        first_time = File.stat(file_path).size
        file_path = Minion::Generator.touch(Minion::Application.minions_root, "timed_file.rb", "BAD BAD BAD")
        second_time = File.stat(file_path).size
        first_time.should == second_time
      end
      
    end
  end
end