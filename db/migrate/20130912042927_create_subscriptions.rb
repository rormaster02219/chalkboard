class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :student_id
      t.string  :email
      t.string :subject

      t.timestamps
    end
  end
end
