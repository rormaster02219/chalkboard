class AddModuleTestName < ActiveRecord::Migration
  def change  
    add_column :results, :module_test_name, :string
    add_column :questions, :module_test_name, :string
    add_column :trackings, :module_test_name, :string
  end

end
