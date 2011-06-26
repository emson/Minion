# Create a testable output object
class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def output
  @output ||= Output.new
end

def minion_commands
  @minion_commands ||= Minion::Commands.new output
end


Given /^I have not run minion init$/ do
  # Stub out File.exists? for minions
  File.stub(:exists?).and_return false
end

Given /^I have already run minion init$/ do
  # File.stub(:exists?).with(File.expand_path('~/minions')).and_return true
  # FileUtils.should_receive(:mkdir).with anything
end

Given /^this is the first time using the minion app$/ do
  File.should_receive(:exists?).with(File.expand_path('~/minions')).and_return false
end

Then /^I should see "([^"]*)" created$/ do |dir_path|
  File.exists?(File.expand_path(dir_path)).should be_true
end

Then /^I should see "([^"]*)"$/ do |message|
  output.messages.should include(message)
end

When /^I type "([^"]*)"$/ do |line_items|
  items = line_items.split
  command, param = items[1], items[2]
  minion_commands.send(command.to_sym, param) if param
  minion_commands.send(command.to_sym) unless param
end

Then /^I should see the error "([^"]*)"$/ do |message|
  output.messages.should include(message)
end


