class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants, id:false do |t|
      t.primary_key :participate_id
      t.text :participate_name

      t.timestamps
    end

    create_table :participants_papers, id: false do |t|
      t.belongs_to :paper, index: true
      t.belongs_to :participant, index: true
    end

  end
end
