class CreateEvidenceItems < ActiveRecord::Migration[5.0]
  def change
    create_table :evidence_items do |t|
      t.integer :evidence_id
      t.integer :paper_id
      t.text :benefit_comeout
      t.text :context
      t.text :confidence_rate
      t.text :integrity

      t.timestamps
    end

    add_foreign_key :evidence_items, :papers, column: :paper_id, primary_key: :paper_id

    create_join_table :evidence_items, :se_methods, table_name: :evidence_method
  end
end
