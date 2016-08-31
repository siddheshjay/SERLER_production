class CreatePapers < ActiveRecord::Migration[5.0]
  def change
    create_table :papers, id:false do |t|
      t.primary_key :paper_id
      t.integer :user_id
      t.integer :paper_status
      t.integer :moderator_id
      t.timestamp :moderated_time
      t.integer :analyst_id
      t.timestamp :analysed_time
      t.text :authors
      t.text :title
      t.text :journal
      t.text :year
      t.text :volume
      t.text :pages
      t.text :month
      t.integer :credibility_rate
      t.text :research_metrix
      t.text :research_aim

      t.timestamps
    end
  end
end
