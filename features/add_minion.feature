Feature: User adds a minion app
	As a user
	I want to add a new app
	So that I handle new functionality
	NB for testing we will use a tmp/minions dir

  Scenario: Add an app before init
    Given I have not run minion init
    When I type "minion add my_app"
    Then I should see the error "Please run 'minion init' first"

  Scenario: Add an app
    Given init has been run
    When I type "minion add my_app"
    Then I should see "Minion 'my_app' at your service master"
    And I should to see "tmp/minions/my_app" created
    And I should to see "tmp/minions/my_app/my_app_main.rb" created