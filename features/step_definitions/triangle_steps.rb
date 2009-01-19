$:.unshift File.join(File::dirname(__FILE__), '..', '..', 'lib')
require 'configurable'
require 'spec/expectations'

class Triangle
  include Configurable

  config_accessor :shape
  config_accessor :color
end

