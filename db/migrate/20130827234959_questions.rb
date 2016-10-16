class Questions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.string :choice_a
      t.string :choice_b
      t.string :choice_c
      t.string :choice_d
      t.string :answer
      
      t.timestamps
    end
  end
end
