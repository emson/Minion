Feature: User initiates the minion app
	
	As a user
	I must run init to initialise the minion app
	So that I can carryout further commands
	NB for testing we will use a tmp/minions dir
  
  Scenario: initialise the minion app
    Given I have not run minion init
    When I type "minion init"
    Then I should text containing "The minions have a new home:"
		And I should to see "tmp/minions" created
		And I should to see "tmp/minions/spec" created