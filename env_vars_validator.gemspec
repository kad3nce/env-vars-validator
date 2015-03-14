Gem::Specification.new do |s|
  s.name        = 'env_vars_validator'
  s.version     = '1.0.0'
  s.date        = '2015-03-14'
  s.summary     = 'Validate that all used ENV vars are defined'
  s.description = 'Greps all Ruby files below the given starting_dir for usage of the ENV hash to ensure that any ENV vars used have been defined.'
  s.authors     = ['Jedidiah Hurt']
  s.email       = 'j@falset.to'
  s.files       = ['lib/env_vars_validator.rb']
  s.homepage    = 'https://github.com/kad3nce/env_vars_validator'
  s.license       = 'MIT'
end
