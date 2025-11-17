require_relative "lib/railsfooter/version"

Gem::Specification.new do |spec|
  spec.name        = "railsfooter"
  spec.version     = Railsfooter::VERSION
  spec.authors     = [ "cb987" ]
  spec.email       = [ "cbarto8@emory.edu" ]
  spec.homepage    = "https://github.com/emory-libraries/rails-footer"
  spec.summary     = ""
  spec.description = ""
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/emory-libraries/rails-footer"
  spec.metadata["changelog_uri"] = "https://github.com/emory-libraries/rails-footer"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 5.0"
end
