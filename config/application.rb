# frozen_string_literal: true

require_relative 'boot'
require "sprockets/railtie"
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    config.load_defaults 6.1
    config.time_zone = 'Moscow'
    config.i18n.default_locale = :ru
    I18n.available_locales = [:en, :ru]
    config.autoload_paths << "#{Rails.root}/lib/clients"
  end
end
