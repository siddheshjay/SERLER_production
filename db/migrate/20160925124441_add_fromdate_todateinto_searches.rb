class AddFromdateTodateintoSearches < ActiveRecord::Migration[5.0]
  def change
    add_column :searches, :from_date, :date
    add_column :searches, :to_date, :date
  end
end
