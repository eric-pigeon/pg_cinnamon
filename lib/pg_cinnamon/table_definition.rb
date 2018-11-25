module PgCinnamon
  module TableDefinition
    def tsquery(*args, **options)
      args.each { |name| column(name, :tsquery, options) }
    end
  end
end
