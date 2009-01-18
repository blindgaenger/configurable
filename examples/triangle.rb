$:.unshift File.join(File::dirname(__FILE__), '..', 'lib')
require 'configurable'

class Triangle
  include Configurable

  config_accessor :shape

  config_accessor :sides do |*args|
    args.join('->')
  end

  config_accessor :angles do |alpha, beta, gamma, *others|
    raise 'more than 3 angles defined' unless others.empty?
    raise 'sum of all angels is not 180' if alpha + beta + gamma != 180
    [alpha, beta, gamma]
  end
end

Triangle.configure('euclid') do
  shape 'isosceles'
  sides 'a', 'b', 'c'
  angles 90, 60, 30
end

p Triangle.configs
#=> {"euclid"=>#<Triangle:0xb7d01e90 @sides="a->b->c", @shape="isosceles", @angles=[90, 60, 30]>}

triangle = Triangle['euclid']
p triangle.sides
#=> "a->b->c"

