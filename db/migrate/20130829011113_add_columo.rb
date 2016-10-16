class AddColumo < ActiveRecord::Migration
  def change
    add_column :results, :module_test, :string
    add_column :results, :subject, :string
    add_column :results, :number, :integer
  end
end
