$:.unshift File.join(File::dirname(__FILE__), '..', '..', 'lib')
require 'configurable'
require 'spec/expectations'


class Person
  include Configurable

  config_reader   :birthday   # can't change it
  config_writer   :nickname   # don't even know how they call you
  config_accessor :friends    # may come and go
end

