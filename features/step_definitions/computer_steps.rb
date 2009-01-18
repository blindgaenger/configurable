$:.unshift File.join(File::dirname(__FILE__), '..', '..', 'lib')
require 'configurable'
require 'spec/expectations'

class Computer
  include Configurable

  attr_accessor :type
  config_accessor :hostname
  config_accessor :ip  
  
  def initialize(host, type)
    @hostname = host
    @type = type
  end
end


# http://rspec.lighthouseapp.com/projects/16211-cucumber/tickets/87-yield-existing-world-object-to-world-block
module Context
  def server(name, &block)
    Computer.configure(name, :server, &block)
  end

  def desktop(name, &block)
    Computer.configure(name, :desktop, &block)
  end

  def notebook(name, &block)
    Computer.configure(name, :notebook, &block)
  end
end

World do |world|
  world.extend(Context)
  world
end


Given /^a helper method "(\w+)" is defined$/ do |method_name|
  respond_to?(method_name.to_sym).should be_true
end

When /^I load config file "(.+)"$/ do |config_file|
  filename = File.expand_path File.join(File::dirname(__FILE__), '..', 'lib', config_file)
  raise "could not find config file #{filename}" unless File.exist? filename
  # eval in the world's context
  eval File.read(filename)
end

Then /^I can get (\d+) configs from (\w+)$/ do |config_count, config_name|
  eval(config_name).size.should == config_count.to_i
  eval(config_name).configs.size.should == config_count.to_i
end

