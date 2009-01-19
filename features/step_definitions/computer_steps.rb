$:.unshift File.join(File::dirname(__FILE__), '..', '..', 'lib')
require 'configurable'
require 'spec/expectations'

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


