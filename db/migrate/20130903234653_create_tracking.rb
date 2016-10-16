class CreateTracking < ActiveRecord::Migration
  def change
    create_table :trackings do |t|
      t.string :module_test
      t.string :subject
      t.integer :question
      t.integer :student_id
      t.timestamps
    end
  end
end
