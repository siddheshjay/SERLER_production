class CreateSearchFields < ActiveRecord::Migration[5.0]
  def change
    create_table :search_fields do |t|

      t.timestamps
    end
  end
end
