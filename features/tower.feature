Feature: Configs with code blocks (Tower example)

  Scenario: code blocks
    Given a configurable class Tower
    And it defines a attr_reader as "stack"
    And it defines a config_attribute as "brick" with do |color| @stack ||= []; @stack << color; end

    When I configure Tower as "Christiansen"
    And I configure "brick" to "red"
    And I configure "brick" to "green"
    And I configure "brick" to "green"        
    And I configure "brick" to "blue"

    Then I can get it from Tower as "Christiansen"
    And I can not get "brick"
    And I can not set "brick"
    And I can get "stack" as ["red", "green", "green", "blue"]

