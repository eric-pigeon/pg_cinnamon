require "rails/railtie"

module PgCinnamon
  class Railtie < Rails::Railtie
    initializer "pg_cinnamon.load" do
      ActiveSupport.on_load :active_record do
        PgCinnamon.load
      end
    end
  end
end
