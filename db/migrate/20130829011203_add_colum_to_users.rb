class AddColumToUsers < ActiveRecord::Migration
  def change
    add_column :students, :first, :string
    add_column :students, :last, :string
    add_column :students, :age, :integer
    add_column :students, :school, :string
    add_column :students, :grade, :integer
    add_column :students, :island, :string
  end
end
