Feature: User adds a minion app
	
	As a user
	I want to add a new app
	So that I handle new functionality

  Scenario: Add an app before init
    Given I have not run minion init
    When I type "minion add my_app"
    Then I should see the error "Please run 'minion init' first"

  Scenario: Add an app
    Given I can now add a minion app
	    And I expect to see "~/minions/my_app" created
	    And I expect to see "~/minions/my_app/my_app_main.rb" file created
    When I type "minion add my_app"
    Then I should see "Minion 'my_app' at your service master"
			And my expectations should be met
