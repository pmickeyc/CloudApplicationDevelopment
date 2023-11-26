# frozen_string_literal: true

require_relative "lib/html_mailer/version"

Gem::Specification.new do |spec|
  spec.name = "html_mailer"
  spec.version = HtmlMailer::VERSION
  spec.authors = ["Padraig McCauley"]
  spec.email = ["63427903+pmickeyc@users.noreply.github.com"]

  spec.summary = "HTML emailer"

  spec.add_development_dependency 'rspec', '~> 3.10'


  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
