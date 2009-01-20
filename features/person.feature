Feature: Config attributes, readers, writers and accessors (Person example)

  Scenario: config_attribute
    Given a configurable class Person
    And it defines a config_attribute as "health"
    And it defines a method as def how_are_you; @health; end

    When I configure Person as "Bertolt Brecht"
    And I configure "health" to "good"

    Then I can get it from Person as "Bertolt Brecht"
    And I can not get "health"
    And I can not set "health"
    And I can get "how_are_you" as "good"

  Scenario: config_reader
    Given a configurable class Person
    And it defines a config_reader as "birthday"

    When I configure Person as "Bertolt Brecht"
    And I configure "birthday" to "1898-02-10"

    Then I can get it from Person as "Bertolt Brecht"
    And I can get "birthday" as "1898-02-10"
    And I can not set "birthday"
    And I can get "birthday" as "1898-02-10"

  Scenario: config_writer
    Given a configurable class Person
    And it defines a config_writer as "nickname"

    When I configure Person as "Bertolt Brecht"
    And I configure "nickname" to "Bert"

    Then I can get it from Person as "Bertolt Brecht"
    And I can not get "nickname"
    And I can set "nickname" to "Herr K."
    And I can not get "nickname"

  Scenario: config_accessor
    Given a configurable class Person
    And it defines a config_accessor as "friends"

    When I configure Person as "Bertolt Brecht"
    And I configure "friends" to ['Hanns Eisler', 'Karl Valentin']

    Then I can get it from Person as "Bertolt Brecht"
    And I can get "friends" as ['Hanns Eisler', 'Karl Valentin']
    And I can set "friends" to ['Hanns Eisler', 'Karl Valentin', 'Carola Neher']
    And I can get "friends" as ['Hanns Eisler', 'Karl Valentin', 'Carola Neher']

