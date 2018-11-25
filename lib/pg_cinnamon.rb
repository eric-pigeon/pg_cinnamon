require "pg_cinnamon/railtie"
require "pg_cinnamon/schema_dumper"
require "pg_cinnamon/table_definition"
require "pg_cinnamon/version"

module PgCinnamon
  def self.load
    ActiveRecord::ConnectionAdapters::PostgreSQL::TableDefinition.include PgCinnamon::TableDefinition
    ActiveRecord::ConnectionAdapters::PostgreSQLAdapter::NATIVE_DATABASE_TYPES.merge!(tsquery: { name: "tsquery" })
    ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.prepend PgCinnamon::SchemaDumper
  end
end
