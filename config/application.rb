require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Bloccit
  class Application < Rails::Application
    config.assets.version = '1.0'
    config.assets.initialize_on_precompile = false
    config.i18n.enforce_available_locales = true
  end
 end
