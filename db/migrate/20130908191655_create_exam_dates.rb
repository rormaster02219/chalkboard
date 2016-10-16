class CreateExamDates < ActiveRecord::Migration
  def change
    create_table :exam_dates do |t|
      t.string :subject
      t.date :exam
      t.timestamps
    end
  end
end
