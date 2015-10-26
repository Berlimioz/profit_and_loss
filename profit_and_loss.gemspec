$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "profit_and_loss/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "profit_and_loss"
  s.version     = ProfitAndLoss::VERSION
  s.authors     = ["Berlimioz"]
  s.email       = ["berlimioz@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ProfitAndLoss."
  s.description = "TODO: Description of ProfitAndLoss."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
