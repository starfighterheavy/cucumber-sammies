lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cucumber/sammies/version"

Gem::Specification.new do |spec|
  spec.name          = "cucumber-sammies"
  spec.version       = Cucumber::Sammies::VERSION
  spec.authors       = ["Jonathan Kirst"]
  spec.email         = ["jskirst@gmail.com"]

  spec.summary       = %q{Cucumber step definitions for rails applications.}
  spec.homepage      = "https://github.com/starfighterheavy/cucumber-sammies"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
