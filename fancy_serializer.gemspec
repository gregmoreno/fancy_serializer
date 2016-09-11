# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |gem|
  gem.name = "fancy_serializer"
  gem.summary  = "ActiveRecord method to create accessors for your serialized fields."
  gem.author   = "Greg Moreno"
  gem.email    = "rubyoncloud@gmail.com"
  gem.homepage = "http://gregmoreno.ca/preventing-model-explosion-via-rails-serialization/"

  gem.description = "Please read this post http://gregmoreno.ca/preventing-model-explosion-via-rails-serialization/ for my motivation behind this gem"
  gem.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE.txt", "Rakefile", "Gemfile", "README"]
  gem.version = "0.0.1"

  gem.add_dependency "rails", ">= 3.2"

  gem.add_development_dependency "sqlite3" #, "1.3.5"
  gem.add_development_dependency "test-unit" #, '~> 3.0'
  gem.add_development_dependency "appraisal"
end
