$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib/', __FILE__)
Dir.glob(File.join(Dir.pwd, "lib", "**", "*#{File::Separator}")).each {|f| $:.unshift f}

require 'rspec'

if ENV['CI']
  require 'simplecov'

  SimpleCov.start do
    add_filter "/spec"
    add_filter "/bin"
    add_filter "/exe"
    minimum_coverage(90)
  end

  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

Dir.glob(File.join(Dir.pwd, "lib", "**", "*.rb")).sort.each do |f|
  require f
end

Dir["#{File.expand_path('../support', __FILE__)}/*.rb"].each do |f|
  require f
end

RSpec.configure do |config|
  # # Enable flags like --only-failures and --next-failure
  # config.example_status_persistence_file_path = ".rspec_status"
  #
  # # Disable RSpec exposing methods globally on `Module` and `main`
  # config.disable_monkey_patching!
  #
  # config.expect_with :rspec do |c|
  #   c.syntax = :expect
  # end
end
