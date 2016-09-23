class CreateG2EvidenceItems < ActiveRecord::Migration[5.0]
  def change
    create_table :g2_evidence_items do |t|
      
      t.references  :evidence_source, foreign_key: true

      t.integer   :creator
      
      t.string    :status   # DRAFT, CONFIRMED, DELETED
      
      t.text      :benefit_under_test
      t.text      :result
      
      t.string    :ctx_why
      t.string    :ctx_who
      t.string    :ctx_what
      t.string    :ctx_where
      t.string    :ctx_when
      t.string    :ctx_how
      
      t.integer   :integrity
      
      t.integer   :rating_tenth

      t.timestamps
    end
    add_foreign_key :g2_evidence_items, :users, column: :creator
    
    create_join_table :g2_evidence_items, :se_methods, table_name: :g2_evidence_item_method
    create_join_table :g2_evidence_items, :methodology, table_name: :g2_evidence_item_methodology
  end
end
