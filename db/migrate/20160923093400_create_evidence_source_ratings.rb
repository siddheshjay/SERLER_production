class CreateEvidenceSourceRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :evidence_source_ratings do |t|
      
      t.references  :evidence_source, foreign_key: true
      
      t.integer   :rater
      t.integer   :credibilty
      t.string    :reason

      t.timestamps
    end
    add_foreign_key :evidence_source_ratings, :users, column: :rater
  end
end
