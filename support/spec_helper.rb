RSpec::Matchers.define :match do |expected|
  match do |actual|
    actual.match expected
  end

  failure_message_for_should do |actual|
     altered_expectation = expected.inspect.gsub(/__/, "FILL ME IN")
    "expected #{actual} to match #{altered_expectation}"
  end
 
  failure_message_for_should_not do |actual|
    altered_expectation = expected.inspect.gsub(/__/, "FILL ME IN")
    "expected #{actual} to not match #{altered_expectation}"
  end
end

def ruby_version?(version)
  RUBY_VERSION =~ /^#{version}/ ||
      (version == 'jruby' && defined?(JRUBY_VERSION)) ||
      (version == 'mri' && !defined?(JRUBY_VERSION))
end

