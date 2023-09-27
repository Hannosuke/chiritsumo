require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "action_cable/engine"

Bundler.require(*Rails.groups)

module Chiritsumo
  class Application < Rails::Application
    config.load_defaults 7.0
    config.generators.system_tests = nil
    config.time_zone = "Tokyo"
    config.i18n.default_locale = :ja
  end
end
