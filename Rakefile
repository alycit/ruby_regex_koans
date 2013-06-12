require 'rake'
require 'rspec/core/rake_task'

task :default => :spec

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w[ --color --require ./support/koans_formatter.rb --format KoansFormatter]
  t.pattern = "support/**/regex_koans.rb"
end
