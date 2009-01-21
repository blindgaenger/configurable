Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = "configurable"
  s.version = "0.2"
  s.date = "2009-01-21"  
  s.authors = ["blindgaenger"]
  s.email = "blindgaenger@gmail.com"
  s.homepage = "http://github.com/blindgaenger/configurable"  
  s.summary = "Little helper to configure ruby instances in a DSLish way."
  
  s.files = [
    "Rakefile",
    "README.textile",
    "lib/configurable.rb",    
    "examples/brecht.rb",
    "examples/computers.config",
    "examples/computers.rb",
    "examples/triangle.rb",
    "examples/website.rb"              
  ]  
  s.require_paths = ["lib"]
  s.add_dependency "cucumber", [">= 0.1.15"]

  s.has_rdoc = "false"
end

