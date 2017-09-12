require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FuelPricesIndia
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # config.assets.precompile += %w( application.css application.js )

    # local time in app, but store data in DB in UTC
    config.time_zone = 'Kolkata'
    config.active_record.default_timezone = :utc

    config.autoload_paths << "#{Rails.root}/lib"
  end
end
