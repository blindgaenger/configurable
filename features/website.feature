Feature: Initalize with the configured key (Website example)

  Scenario: StackOverflow
    Given a configurable class Website
    And it defines a config_accessor as "name"
    And it defines a config_accessor as "url"    
    And it defines a method as def initialize(key); @name = key; end

    When I configure Website as "StackOverflow"
    And I configure "url" to "http://stackoverflow.com/"

    Then I can get it from Website as "StackOverflow"
    And I can get "name" as "StackOverflow"
    And I can get "url" as "http://stackoverflow.com/"

