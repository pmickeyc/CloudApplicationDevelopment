# frozen_string_literal: true

require_relative 'lib/html_mailer/version'

Gem::Specification.new do |spec|
  spec.name = 'html_mailer'
  spec.version = HtmlMailer::VERSION
  spec.authors = ['Padraig McCauley']
  spec.email = ['63427903+pmickeyc@users.noreply.github.com']

  spec.summary = 'HTML emailer'

  spec.add_development_dependency 'rspec', '~> 3.10'

  spec.files = Dir.glob('lib/**/*') + ['README.md', 'LICENSE.txt']
  spec.require_paths = ['lib']

  spec.bindir = 'exe'
  spec.executables = Dir.glob('exe/*').map { |f| File.basename(f) }
end
