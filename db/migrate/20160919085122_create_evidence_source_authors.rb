class CreateEvidenceSourceAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :evidence_source_authors do |t|
      t.references :evidence_source, foreign_key: true
      t.string :name
      t.string :name_abbr

      t.timestamps
    end
    add_index :evidence_source_authors, :name
    add_index :evidence_source_authors, :name_abbr
  end
end
