class ChangePinsIntegerString < ActiveRecord::Migration
  def change
    change_column :pins, :number, :string
  end
end
