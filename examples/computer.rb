$:.unshift File.join(File::dirname(__FILE__), '..', 'lib')
require 'configurable'

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


# define some DSLish config helpers

def server(name, &block)
  Computer.configure(name, :server, &block)
end

def desktop(name, &block)
  Computer.configure(name, :desktop, &block)
end

def notebook(name, &block)
  Computer.configure(name, :notebook, &block)
end


# load the config (here from 'computer.config')
config_file = $0.gsub /#{File.extname($0)}$/, '.config'
load config_file


# now use them

ips = Computer.map {|name, computer| computer.ip }
#=> ["192.168.0.201", "192.168.0.200", "192.168.0.202", "192.168.0.203"]

Computer['raumstation'] #=> <Computer:0xb7c6e4c4 @type=:server, @hostname="raumstation", @ip="192.168.0.201">
Computer['apfelsaft']   #=> <Computer:0xb7c6e62c @type=:desktop, @hostname="apfelsaft", @ip="192.168.0.200">
Computer['wohnserver']  #=> <Computer:0xb7c6e370 @type=:server, @hostname="wohnserver", @ip="192.168.0.202">
Computer['leuchtspur'] #=> <Computer:0xb7c6e21c @type=:notebook, @hostname="leuchtspur", @ip="192.168.0.203">
