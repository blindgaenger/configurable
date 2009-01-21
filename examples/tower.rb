$:.unshift File.join(File::dirname(__FILE__), '..', 'lib')
require 'configurable'

class Tower
  include Configurable

  attr_reader :stack

  config_attribute :brick do |color|
    raise "argh, #{color}!!!" if color == 'purple'
    @stack ||= []
    @stack << color
  end

end

# let's build some towers of colored bricks

brick = Tower.configure 'nice' do
  brick 'red'
  brick 'green'
  brick 'green'
  brick 'blue'
end
brick.stack #=> ["red", "green", "green", "blue"]

begin
  Tower.configure 'ugly' do
    brick 'red'
    brick 'purple'  
    brick 'blue'
  end
rescue RuntimeError
  #=> argh, purple!!!
end

