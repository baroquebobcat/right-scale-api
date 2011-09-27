# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{right-scale-api}
  s.version = "0.0.6"
  s.date = %q{2010-11-02}
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nick Howard"]
  s.description = %q{A client for the RightScale API that hides some of the complexity of the API
(It doesn't require passing around hrefs as much). Based on HTTParty
}
  s.email = %q{ndh@baroquebobcat.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.md",
     "Rakefile",
     "right-scale-api.gemspec"] + Dir["{lib,spec}/**/*"]
  s.homepage = %q{http://github.com/baroquebobcat/right-scale-api}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A RightScale API gem that doesn't suck.(mostly)}
  s.test_files = [
    "spec/right-scale-api_spec.rb",
     "spec/spec_helper.rb"
  ]

  s.add_runtime_dependency(%q<httparty>, ["~> 0.6.0"])
  s.add_runtime_dependency(%q<activesupport>, [">= 0"])
  s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
end

