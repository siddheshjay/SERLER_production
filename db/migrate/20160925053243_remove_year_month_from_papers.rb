class RemoveYearMonthFromPapers < ActiveRecord::Migration[5.0]
  def change
    remove_column :papers, :year, :text
    remove_column :papers, :month, :text
  end
end
