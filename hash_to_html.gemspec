# -*- encoding: utf-8 -*-
require File.expand_path('../lib/hash_to_html/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Josh Crews"]
  gem.email         = ["crews.josh@gmail.com"]
  gem.description   = %q{For Rails, Html formats Hash into ul and li html tags}
  gem.summary       = %q{For Rails projects, this will take a Hash and make into html including nested hashes}
  gem.homepage      = "http://github.com/joshcrews/hash_to_html"

  gem.add_development_dependency "rspec"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "hash_to_html"
  gem.require_paths = ["lib"]
  gem.add_dependency('activesupport')
  gem.add_dependency('actionpack')
  gem.version       = HashToHtml::VERSION
end
