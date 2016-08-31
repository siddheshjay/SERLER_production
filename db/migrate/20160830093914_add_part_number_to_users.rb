class AddPartNumberToUsers < ActiveRecord::Migration[5.0]
  def up
    def change
      add_column :users, :user_status, :integer,
                 :user_name, :text,
                 :full_name, :text,
                 :user_gender, :integer,
                 :user_age, :integer

    end
  end

  def down
    remove_column :users, :user_status, :integer,
                  :user_name, :text,
                  :full_name, :text,
                  :user_gender, :integer,
                  :user_age, :integer
  end
end
