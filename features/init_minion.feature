Feature: User initiates the minion app
	
	As a user
	I must run init to initialise the minion app
	So that I can carryout further commands
  
  Scenario: initialise the minion app
    Given this is the first time using the minion app
    When I type "minion init"
    Then I should see "The minions have a new home"
    And I expect to see "~/minions" created