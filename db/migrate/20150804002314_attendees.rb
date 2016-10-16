class Attendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.belongs_to :clasroom, index: true
      t.belongs_to :student, index: true
      t.string :status
      t.timestamps 
    end
  end
end
