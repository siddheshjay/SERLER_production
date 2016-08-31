class CreateSeMethods < ActiveRecord::Migration[5.0]
  def change
    create_table :se_methods, id:false do |t|
      t.primary_key :method_id
      t.text :method_name
      t.integer :methodology_id
      t.timestamps
    end
  end
end
