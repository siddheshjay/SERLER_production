class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.integer :news_id
      t.text :news_body

      t.timestamps
    end
  end
end
