class DropAdd < ActiveRecord::Migration
  def change
  remove_column :questions, :module_test_name, :string
  end
end
