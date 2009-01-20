Given /^a configurable class (.*)$/ do |class_name|
  @config_class = Class.new do
    include Configurable
  end
  Object.const_set class_name, @config_class
end

Given /^it defines a (\w+) as "(\w+)"$/ do |type, name|
  # config_* as :foobar
  @config_class.instance_eval "#{type} :#{name}"
end

Given /^it defines a method as (.*)$/ do |method|
  @config_class.class_eval method
end

Given /^a helper method "(\w+)" is defined$/ do |method_name|
  respond_to?(method_name.to_sym).should be_true
end


When /^I configure (\w+) as (.*)$/ do |config_name, key|
  @config_class = eval(config_name)
  @config_instance = @config_class.configure(eval(key)) do
    # configure attributes in the following steps
  end
end

When /^I configure "(\w+)" to (.*)$/ do |attribute, value|
  # need to do this "from inside" to be sure
  @config_instance.instance_eval do
    send attribute.to_sym, eval(value)
  end
end

When /^I load config file "(.+)"$/ do |config_file|
  filename = File.expand_path File.join(File::dirname(__FILE__), '..', 'lib', config_file)
  raise "could not find config file #{filename}" unless File.exist? filename
  # eval in the world's context
  eval File.read(filename)
end


Then /^I can get it from (\w+) as (.*)$/ do |config_name, key|
  @config_class = eval(config_name)
  @config_instance = @config_class[eval(key)]
  @config_instance.should_not be_nil
  @config_instance.class.should == @config_class
end

Then /^I can get "(\w+)" as (.*)$/ do |attribute, value|
  @config_instance.send(attribute.to_sym).should == eval(value)
end

Then /^I can set "(\w+)" to (.*)$/ do |attribute, value|
  @config_instance.send "#{attribute}=".to_sym, eval(value)
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

Then /^I can get (\d+) configs from (\w+)$/ do |config_count, config_name|
  eval(config_name).size.should == config_count.to_i
  eval(config_name).configs.size.should == config_count.to_i
end
