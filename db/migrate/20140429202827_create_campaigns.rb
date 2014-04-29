class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :details
      t.integer :target
      t.datetime :end_date
      t.references :user, index: true

      t.timestamps
    end
  end
end
