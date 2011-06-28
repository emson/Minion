Feature: User lists all the minions
	As a user
	I want to be able to see all the apps in the minions directory
	So that I know what commands I can use
  
  
  Scenario: List an app before init
    Given I have not run minion init
    When I type "minion list"
    Then I should see the error "Please run 'minion init' first"
  
  Scenario Outline: List minion apps
    Given init has been run
    And I have a minion "<app>"
    When I type "minion list"
    Then I will see "<app>" in the list
    
  Scenarios: all apps present
    |   app    |
    | my_app_1 |
    | my_app_2 |