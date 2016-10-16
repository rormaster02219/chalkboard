class CreateSubscriptionsAdds < ActiveRecord::Migration
  def change
    create_table :subscriptions_adds do |t|
      add_column :subscriptions, :stripe_customer_token, :string
      t.timestamps
    end
  end
end
