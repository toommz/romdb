Gem::Specification.new do |s|
  s.name        = 'romdb'
  s.version     = '0.0.1'
  s.date        = '2016-09-27'
  s.summary     = 'Access OMDb API in Ruby'
  s.description = 'Access OMDb API in Ruby (beta)'
  s.authors     = ['Thomas Battiston']
  s.email       = 'thomas.battiston@gmail.com'
  s.files       = ['lib/romdb.rb', 'lib/romdb/search.rb', 'lib/romdb/request.rb', 'lib/romdb/response.rb']
  s.homepage    = 'http://rubygems.org/gems/romdb'
  s.license     = 'MIT'

  s.add_development_dependency 'rspec', '~> 3.5'
end
