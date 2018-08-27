Gem::Specification.new do |s|
    s.name        = 'onboarding'
    s.version     = '0.0.0'
    s.date        = '2018-08-23'
    s.summary     = "Response validator"
    s.description = "A simple response validator"
    s.authors     = ["Hein Dewantara"]
    s.email       = 'hein.dewantara@bukalapak.com'
    s.files       = ["lib/onboarding.rb"]
    s.license       = 'MIT'

    s.add_development_dependency "nokogiri", "~> 1.8"
    s.add_development_dependency "net", "~> 0.3.3"
    s.add_development_dependency "json", "~> 2.1"
    
  end