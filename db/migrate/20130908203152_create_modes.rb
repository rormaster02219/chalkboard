class CreateModes < ActiveRecord::Migration
  def change
    create_table :modes do |t|
      t.integer :student_id
      t.integer :points
      t.date :latest_activity
      t.timestamps
    end
  end
end
