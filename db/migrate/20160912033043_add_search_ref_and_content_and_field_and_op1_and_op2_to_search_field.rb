class AddSearchRefAndContentAndFieldAndOp1AndOp2ToSearchField < ActiveRecord::Migration[5.0]
  def change
    add_reference :search_fields, :search, foreign_key: true
    add_column :search_fields, :content, :string
    add_column :search_fields, :field, :string
    add_column :search_fields, :op1, :string
    add_column :search_fields, :op2, :string
  end
end
