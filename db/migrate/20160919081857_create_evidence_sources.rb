class CreateEvidenceSources < ActiveRecord::Migration[5.0]
  def change
    create_table :evidence_sources do |t|
      t.string :status,           null: false
      
      t.integer :submitter_id,      null: false
      t.integer :moderator_id
      t.integer :analyst_id
      
      t.timestamp :moderated_time
      t.timestamp :published_time
      
      t.string :category
      
      t.string  :raw_bib
      t.string  :raw_apa
      
      t.string :title,            null: false
      t.integer :year
      t.string  :month
      t.string :source_title
      t.string :publisher
      t.string :URL
      t.string :DOI
      t.integer :volume_number
      t.integer :issue_number
      t.string :page_str
      t.integer :page_begin
      t.integer :page_cease
      t.integer :rating_tenth
      t.integer :rating_tenth_avg
      t.integer :rating_tenth_moderated
      
      t.text    :research_aim

      t.timestamps
    end
    
    add_foreign_key :evidence_sources, :users, column: :submitter_id
    add_foreign_key :evidence_sources, :users, column: :moderator_id
    add_foreign_key :evidence_sources, :users, column: :analyst_id

    add_index :evidence_sources, :status
    
    add_index :evidence_sources, :submitter_id
    add_index :evidence_sources, :moderator_id
    add_index :evidence_sources, :analyst_id

    add_index :evidence_sources, :title
    add_index :evidence_sources, :year
    add_index :evidence_sources, :source_title
    add_index :evidence_sources, :publisher
    add_index :evidence_sources, :DOI
    add_index :evidence_sources, :page_begin
    add_index :evidence_sources, :page_cease
    add_index :evidence_sources, :rating_tenth
  end
end
