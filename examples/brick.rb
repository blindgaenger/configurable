$:.unshift File.join(File::dirname(__FILE__), '..', 'lib')
require 'configurable'

class Brick
  include Configurable
  
  config_attribute :stack do |color|
    @tower << color
  end
  
  attr_reader :tower

  def initialize
    @tower = []
  end
  
end


brick = Brick.configure '' do
  stack 'red'
  stack 'green'
  stack 'green'
  stack 'blue'
end

p brick.tower

