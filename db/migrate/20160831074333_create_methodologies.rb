class CreateMethodologies < ActiveRecord::Migration[5.0]
  def change
    create_table :methodologies, id: false do |t|
      t.primary_key :methodology_id
      t.text :methodology_name
      t.text :description

      t.timestamps
    end

    add_foreign_key :se_methods, :methodologies, column: :methodology_id, primary_key: :methodology_id
  end
end
