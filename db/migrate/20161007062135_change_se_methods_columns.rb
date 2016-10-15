class ChangeSeMethodsColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :se_methods, :method_description, :text
    remove_column :se_methods, :methodology_id, :integer
    
    create_join_table :se_methods, :methodologies, table_name: :se_method_methodology_links
  end
end
