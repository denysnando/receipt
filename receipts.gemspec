require_relative 'lib/receipts/version'

Gem::Specification.new do |spec|
  spec.name        = 'receipts'
  spec.version     = Receipts::VERSION
  spec.authors     = ['denysnando']
  spec.email       = ['denysnando@gmail.com']
  spec.summary     = 'Summary of Receipts'
  spec.description = 'Description of Receipts'
  spec.license     = 'MIT'
  spec.homepage    = 'https://github.com/denysnando/receipt'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_development_dependency 'pry', '>= 0.14.2'
  spec.add_dependency 'rails', '>= 7.0.5'
  spec.add_development_dependency 'rspec', '~> 3.12'
  spec.add_development_dependency 'rubocop', '~> 1.56.2'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
