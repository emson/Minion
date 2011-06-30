require 'spec_helper'

module Minion
  describe Generator do
    
    after :each do
      clean_up_tests
    end
    
    it "should generate the specified directory" do
      test_dir = Generator.mkdir("tmp_rspec")
      File.exists?(File.join(Minion::ROOT, "tmp_rspec")).should be_true
    end
    
    it "should generate the specified directory based on a root" do
      test_dir = Generator.mkdir(Minion::Application.minions_root, "test_example2")
      File.exists?(File.join(Minion::Application.minions_root, "test_example2")).should be_true
    end
    
    it "should generate the specified directory array path" do
      test_dir = Generator.mkdir(Minion::Application.minions_root, "test_example2", "another")
      File.exists?(File.join(Minion::Application.minions_root, "test_example2", "another")).should be_true
    end
    
  end
end