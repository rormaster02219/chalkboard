class AddTimerToQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :timer, :integer
  end
end
