class AddReleaseDateToPapers < ActiveRecord::Migration[5.0]
  def change
    add_column :papers, :release_date, :date
  end
end
