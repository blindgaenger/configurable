Feature: Use in configuration files (Computer example)

  Scenario: load config from file
    Given a configurable class Computer
    And it defines a config_accessor called "hostname"
    And it defines a config_accessor called "ip"    

    And a helper method "server" is defined
    And a helper method "desktop" is defined    
    And a helper method "notebook" is defined

    When I load config file "computer.config"

    Then I can get 4 configs from Computer

    And I can get it from Computer as "apfelsaft"
    And I can get "hostname" as "apfelsaft"            
#    And I can get "type" as ":desktop"
    And I can get "ip" as "192.168.0.200"        

    And I can get it from Computer as "raumstation"
    And I can get "hostname" as "raumstation"            
#    And I can get "type" as ":server"
    And I can get "ip" as "192.168.0.201"    

    And I can get it from Computer as "wohnserver"
    And I can get "hostname" as "wohnserver"        
#    And I can get "type" as ":server"
    And I can get "ip" as "192.168.0.202"        
    
    And I can get it from Computer as "leuchtspur"
    And I can get "hostname" as "leuchtspur"    
#    And I can get "type" as ":notebook"
    And I can get "ip" as "192.168.0.203"        
    
