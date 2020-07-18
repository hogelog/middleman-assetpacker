# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "middleman-assetpacker"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["hogelog"]
  s.email       = ["konbu.komuro@gmail.com"]
  s.homepage    = "https://github.com/hogelog/middleman-assetpacker"
  s.summary     = %q{Asset packer plugin for middleman}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_runtime_dependency("middleman-core", [">= 4.3"])
end
