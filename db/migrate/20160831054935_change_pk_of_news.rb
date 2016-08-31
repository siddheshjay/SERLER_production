class ChangePkOfNews < ActiveRecord::Migration[5.0]
  def change
   # remove_column :news, :id, :integer
    change_table :news, id:false do |t|
      t.remove :id
      t.remove :news_id
      t.primary_key :news_id
    end
  end
end
