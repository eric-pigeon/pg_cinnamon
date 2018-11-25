require "spec_helper"

class SearchSynonyms < ActiveRecord::Base; end

RSpec.describe PgCinnamon::SchemaDumper, :db do
  with_model :SearchSynonyms do
    table do |t|
      t.tsquery :term
      t.tsquery :synonym
    end
  end

  it "dumps tsquery columns" do
    stream = StringIO.new

    ActiveRecord::SchemaDumper.dump(SearchSynonyms.connection, stream)

    output = stream.string

    expect(output).to include 't.tsquery "term"'
    expect(output).to include 't.tsquery "synonym"'
  end
end
