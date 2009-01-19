$:.unshift File.join(File::dirname(__FILE__), '..', '..', 'lib')
require 'configurable'
require 'spec/expectations'

class Website
  include Configurable
  
  config_accessor :name  
  config_accessor :url

  def initialize(key)
    @name = key
  end
end

Website.configure 'StackOverflow' do
  url 'http://stackoverflow.com/'
end

so = Website['StackOverflow']
so.name  #=> StackOverflow
so.url   #=> http://stackoverflow.com/

