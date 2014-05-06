class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.references :reward_level, index: true
      t.string :stripe_txn_id

      t.timestamps
    end
  end
end
