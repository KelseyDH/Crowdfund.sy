class AddStateToCampaigns < ActiveRecord::Migration
  def change

    add_column :campaigns, :state, :string

    add_index :campaigns, :state
  end
end
