Feature: Basic usage (Triangle example)

  Scenario: euclid and pythagoras
    Given a configurable class Triangle
    And it defines a config_accessor as "shape"
    And it defines a config_accessor as "color"

    When I configure Triangle as "euclid"
    And I configure "shape" to "isosceles"
    And I configure "color" to "red"
    And I configure Triangle as "pythagoras"
    And I configure "shape" to "equilateral"
    And I configure "color" to "blue"

    Then I can get 2 configs from Triangle
    And I can get it from Triangle as "euclid"
    And I can get "shape" as "isosceles"
    And I can get "color" as "red"
    And I can get it from Triangle as "pythagoras"
    And I can get "shape" as "equilateral"
    And I can get "color" as "blue"

