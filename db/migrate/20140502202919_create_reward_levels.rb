class CreateRewardLevels < ActiveRecord::Migration
  def change
    create_table :reward_levels do |t|
      t.string :title
      t.text :details
      t.integer :amount
      t.references :campaign, index: true

      t.timestamps
    end
  end
end
