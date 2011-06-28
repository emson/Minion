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


Before do
  FileUtils.rm_rf(Minion::MINIONS_PATH) if File.exists?(Minion::MINIONS_PATH)
end


Given /^I have not run minion init$/ do
  File.exists?(Minion::MINIONS_PATH).should be_false
end


Given /^init has been run$/ do
  minion_commands.send :init
end

Given /^I have a minion "([^"]*)"$/ do |app|
  minion_commands.send(:add, app)
end

Then /^I will see "([^"]*)" in the list$/ do |app|
  output.messages.should include(app)
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


Then /^I should to see "([^"]*)" created$/ do |my_path|
  File.exists?(File.expand_path(my_path)).should be_true
end


