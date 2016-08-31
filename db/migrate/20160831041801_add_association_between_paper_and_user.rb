class AddAssociationBetweenPaperAndUser < ActiveRecord::Migration[5.0]
  def change

    #add_reference :papers, :users,
    #remove_foreign_key :papers, column: :user_id
    #add_foreign_key :papers, :users, column: :user_id
    add_foreign_key :papers, :users, column: :moderator_id
    add_foreign_key :papers, :users, column: :analyst_id

  end
end
