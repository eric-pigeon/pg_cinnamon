ENV["RAILS_ENV"] = "test"

require "bundler/setup"
require_relative "../spec/dummy/config/environment"
require "database_cleaner"
require "pg_cinnamon"
require 'with_model'
# require 'database/setup'

RSpec.configure do |config|
  config.extend WithModel
  config.order = "random"
  DatabaseCleaner.strategy = :transaction
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.around(:each, db: true) do |example|
    #DatabaseCleaner.start
    example.run
    #DatabaseCleaner.clean
  end
end
