module PgCinnamon
  module SchemaDumper
    def initialize_type_map(m = type_map)
      m.register_type "tsquery", ActiveRecord::ConnectionAdapters::PostgreSQL::OID::SpecializedString.new(:tsquery)
      super
    end
  end
end
