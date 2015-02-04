Gem::Specification.new do |spec|
  spec.name = "puppet-dashboard-api"
  spec.version = "0.0.1"
  spec.authors = ["Joshua B. Bussdieker"]

  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
  spec.add_runtime_dependency 'activeresource'
end
