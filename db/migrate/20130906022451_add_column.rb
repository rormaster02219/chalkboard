class AddColumn < ActiveRecord::Migration
  def change
    add_column :questions, :module_test_name, :string
  end
end
