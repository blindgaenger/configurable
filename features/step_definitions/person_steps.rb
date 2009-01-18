$:.unshift File.join(File::dirname(__FILE__), '..', '..', 'lib')
require 'configurable'
require 'spec/expectations'


class Person
  include Configurable

  config_reader   :birthday   # can't change it
  config_writer   :nickname   # don't even know how they call you
  config_accessor :friends    # may come and go
end


Given /^a configurable class (.*)$/ do |config_name|
  @config_class = eval(config_name)
  @config_class.should_not be_nil
  @config_class.included_modules.include?(Configurable).should be_true
end

Given /^it defines a config_(\w+) called "(\w+)"$/ do |type, name|
  raise "unknown config type #{type}" unless %(reader writer accessor).include? type  

  m = (@config_class.instance_methods - Object.methods)
  if %(accessor reader).include? type  
    m.include?(name).should be_true
  end
  if %(accessor writer).include? type
    m.include?("#{name}=").should be_true  
  end
end

When /^I configure (\w+) as "(.*)"$/ do |config_name, key|
  @config_class.to_s.should == config_name
  @config_instance = @config_class.configure(key) do
    # configure attributes in the following steps
  end
end

When /^I configure "(\w+)" to "(.*)"$/ do |attribute, value|
  # need to do this "from inside" to be sure
  @config_instance.instance_eval do
    send attribute.to_sym, value
  end
end

Then /^I can get it from (\w+) as "(.*)"$/ do |config_name, key|
  @config_instance = @config_class[key]
  @config_instance.should_not be_nil
  @config_instance.class.should == @config_class
end

Then /^I can get "(\w+)" as "(.*)"$/ do |attribute, value|
  @config_instance.send(attribute.to_sym).should == value
end

Then /^I can set "(\w+)" to "(.*)"$/ do |attribute, value|
  @config_instance.send "#{attribute}=".to_sym, value
end

Then /^I can not set "(\w+)"$/ do |attribute|
  lambda {
    @config_instance.send "#{attribute}=".to_sym, nil
  }.should raise_error(NoMethodError)
end

Then /^I can not get "(\w+)"$/ do |attribute|
  lambda {
    @config_instance.send(attribute.to_sym)
  }.should raise_error(NoMethodError)
end



