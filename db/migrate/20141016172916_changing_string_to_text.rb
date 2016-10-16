class ChangingStringToText < ActiveRecord::Migration
  def change
     change_column :questions, :solution, :text
  end
end
