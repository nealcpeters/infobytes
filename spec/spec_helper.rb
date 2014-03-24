

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require "capybara/rails"
require 'database_cleaner'

require 'coveralls'
require "factory_girl_rails"

Coveralls.wear!('rails')

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  # Inserted later for capybara and DatabaseCleaner
  config.include Capybara::DSL

  config.mock_with :rspec

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  def user_create
    @user = User.create(first_name: "Han", last_name: "Solo", user_name: "tutorial_tester", email: "tutorial_tester@aliance.com", password: "password", password_confirmation: "password")
  end

  def tutorial_create
    @tutorial = @user.tutorials.create(title: "How to Be Matt", description: "A detailed tutorial on how to be the most gnarly land lubber of a freight train", rating: 3, subtopic_id: 2)
  end

  def chapter_create
    @chapter = @tutorial.chapters.create(title: "blah", number: 1, tutorial_id: @tutorial.id)
  end

  def sub_chapter_create
    @sub_chapter = @chapter.sub_chapters.create(title: "subbie", chapter_id: @chapter.id)
  end

   
  def log_user_in 
    visit "/"    
    find(:xpath, "//a[@href='/users/sign_in']").click

    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: "password"
    click_button "Sign in"
  end
  
end
