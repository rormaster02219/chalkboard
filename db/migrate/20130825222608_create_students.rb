class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :nickname
      t.string :email
      t.string :password
      t.string :password_confirmation

      t.timestamps
    end
  end
end
