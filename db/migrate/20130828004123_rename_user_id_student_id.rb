class RenameUserIdStudentId < ActiveRecord::Migration
  def change

    change_table :results do |t|
     t.rename :user_id, :student_id
    end
  
  end
end
