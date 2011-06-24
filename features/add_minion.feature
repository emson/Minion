Feature: User adds a minion app
	
	As a user
	I want to add a new app
	So that I handle new functionality
  
  Scenario: Add an app
    Given I have not started minion
    When I type "minion add my_app"
    Then I should see "my_app" created
