require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)
require "pg_cinnamon"

module Dummy
  class Application < Rails::Application
    config.load_defaults 5.2
    config.cache_classes = true
    config.eager_load = false
    config.active_support.deprecation = :stderr
  end
end
