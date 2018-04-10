RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:transaction)
  end

  config.around do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
