class CreateClassroom < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :topic
      t.timestamps  :date
      t.integer :size
      t.string :waitlist

      t.timestamps
    end
  end
end
