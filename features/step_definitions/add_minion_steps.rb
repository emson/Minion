
def minion_commands
  @minion_commands ||= Minion::Commands.new
end


Given /^I have not started minion$/ do
end

When /^I type "([^"]*)"$/ do |line_items|
  items = line_items.split
  command, param = items[1], items[2]
  minion_commands.send(command.to_sym, param)
end

Then /^I should see "([^"]*)" created$/ do |app_name|
  raise "TODO: Boom please implement..."
end
