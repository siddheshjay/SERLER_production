class CreateResearchDesigns < ActiveRecord::Migration[5.0]
  def change
    create_table :research_designs do |t|
      
      t.references  :evidence_source, foreign_key: true
      t.string      :category # METHOD, PARTICIPANT, or METRIC
      t.integer     :ref_id
      t.string      :ref_text
      
      t.timestamps
    end
  end
end
