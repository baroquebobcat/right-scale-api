# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{right-scale-api}
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nick Howard"]
  s.date = %q{2010-09-14}
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
     "VERSION",
     "lib/right-scale-api.rb",
     "lib/right-scale-api/account.rb",
     "lib/right-scale-api/alert_spec.rb",
     "lib/right-scale-api/base.rb",
     "lib/right-scale-api/client.rb",
     "lib/right-scale-api/deployment.rb",
     "lib/right-scale-api/ec2_ebs_snapshot.rb",
     "lib/right-scale-api/ec2_ebs_volume.rb",
     "lib/right-scale-api/ec2_elastic_ip.rb",
     "lib/right-scale-api/ec2_security_group.rb",
     "lib/right-scale-api/ec2_ssh_key.rb",
     "lib/right-scale-api/s3_bucket.rb",
     "lib/right-scale-api/server.rb",
     "lib/right-scale-api/server_template.rb",
     "lib/right-scale-api/status.rb",
     "right-scale-api.gemspec",
     "spec/right-scale-api_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
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

