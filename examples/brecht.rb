$:.unshift File.join(File::dirname(__FILE__), '..', 'lib')
require 'configurable'

class Person
  include Configurable

  config_reader   :birthday   # can't change it
  config_writer   :nickname   # don't even know how they call you
  config_accessor :friends    # may come and go
end

Person.configure 'Bertolt Brecht' do
  birthday '1898-02-10'
  nickname 'Bert'
  friends 'Hanns Eisler', 'Karl Valentin'
end

brecht = Person['Bertolt Brecht']

# reader
puts brecht.birthday
begin  
  brecht.birthday = '2008-12-24'
rescue NoMethodError => ex
  puts ex
end

# writer
brecht.nickname = 'Herr K.'
begin
  brecht.nickname
rescue NoMethodError => ex
  puts ex
end

# accessor
p brecht.friends
brecht.friends << 'Carola Neher'
p brecht.friends  
