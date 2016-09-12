class AddNameAndSavedOnToSearch < ActiveRecord::Migration[5.0]
  def change
    add_column :searches, :name, :string
    add_column :searches, :saved_on, :date
  end
end
