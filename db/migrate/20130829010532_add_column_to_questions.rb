class AddColumnToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :module_test, :string
    add_column :questions, :subject, :string
    add_column :questions, :number, :integer
  end
end
