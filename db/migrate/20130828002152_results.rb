class Results < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :question_id
      t.integer :user_id
      t.boolean :correct
      t.string :student_answer
 
      t.timestamps
    end  
  end

end
