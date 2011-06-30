require 'spec_helper'

module Minion
  describe Application do
    
    it "should have a default root 'minions' directory" do
      default_minions_root = File.expand_path(File.join(File.dirname(__FILE__), '../../', 'minions'))
      Minion::Application.minions_root.should == default_minions_root
    end
    
  end
end