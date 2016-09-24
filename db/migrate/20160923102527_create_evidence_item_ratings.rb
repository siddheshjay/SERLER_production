class CreateEvidenceItemRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :evidence_item_ratings do |t|
      
      t.references  :g2_evidence_item, foreign_key: true
      
      t.integer     :rater
      t.integer     :confidence
      t.string      :reason

      t.timestamps
    end
    
    add_foreign_key :evidence_item_ratings, :users, column: :rater
  end
end
