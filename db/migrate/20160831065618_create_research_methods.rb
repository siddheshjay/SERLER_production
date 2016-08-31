class CreateResearchMethods < ActiveRecord::Migration[5.0]
  def change
    create_table :research_methods, id: false do |t|
      t.primary_key :research_method_id
      t.text :method_name
      t.integer :method_status

      t.timestamps
    end

    create_table :research_methods_papers, id: false do |t|
      t.belongs_to :research_method, index: true
      t.belongs_to :paper, index: true
    end
  end
end
