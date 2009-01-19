Feature: Initalize with the configured key (Website example)

  Scenario: StackOverflow
    Given a configurable class Website
    And it defines a config_accessor called "name"
    And it defines a config_accessor called "url"    
    And it defines the constructor "def initialize(key); @name = key; end"

    When I configure Website as "StackOverflow"
    And I configure "url" to "http://stackoverflow.com/"

    Then I can get it from Website as "StackOverflow"
    And I can get "name" as "StackOverflow"
    And I can get "url" as "http://stackoverflow.com/"

