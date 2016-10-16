class AddActivity < ActiveRecord::Migration
  def change
    add_column :subscriptions, :activity, :string
  end
end
