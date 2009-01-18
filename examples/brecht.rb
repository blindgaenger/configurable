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
brecht.birthday   #=> 1898-02-10
begin  
  brecht.birthday = '2008-12-24'
rescue NoMethodError => ex
  #=> undefined method `birthday=' for #<Person:0xb7c30d04>
end

# writer
brecht.nickname = 'Herr K.'
begin
  brecht.nickname
rescue NoMethodError => ex
  #=> super: no superclass method `nickname'
end

# accessor
brecht.friends    #=> ["Hanns Eisler", "Karl Valentin"]
brecht.friends << 'Carola Neher'
brecht.friends    #=> ["Hanns Eisler", "Karl Valentin", "Carola Neher"]

