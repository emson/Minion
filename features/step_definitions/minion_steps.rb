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


Given /^I can now add a minion app$/ do
  File.stub(:exists?).with(File.expand_path(Minion::MINIONS_PATH)).and_return true
end


Given /^this is the first time using the minion app$/ do
  FileUtils.should_receive(:mkdir_p).with(File.expand_path("#{Minion::MINIONS_PATH}"))
end


Given /^I expect to see "([^"]*)" created$/ do |dir_path|
  FileUtils.should_receive(:mkdir_p).with(File.expand_path(dir_path))
end


Given /^I expect to see "([^"]*)" file created$/ do |file_path|
  File.should_receive(:open).with(File.expand_path("#{file_path}", "w")).and_return true
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


Then /^I should see "([^"]*)"$/ do |message|
  output.messages.should include(message)
end


Then /^my expectations should be met$/ do
end
