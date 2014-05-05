class AddSlugToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :slug, :string, unique: true
    add_index :campaigns, :slug
  end
end
