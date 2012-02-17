# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "oeis/version"

Gem::Specification.new do |s|
  s.name        = "oeis"
  s.version     = Oeis::VERSION
  s.authors     = ["Jordan Scales"]
  s.email       = ["scalesjordan@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{On-Line Encyclopedia of Integer Sequences gem}
  s.description = %q{Allows you to fetch results from OEIS using a list of integers}

  s.rubyforge_project = "oeis"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "nokogiri"
  s.add_runtime_dependency "nokogiri"
end
