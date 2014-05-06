class AddStripeColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_customer_id, :string
    add_column :users, :stripe_card_last4, :string
    add_column :users, :stripe_card_type, :string
  end
end
