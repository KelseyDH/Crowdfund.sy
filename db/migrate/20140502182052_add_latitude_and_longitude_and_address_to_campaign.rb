class AddLatitudeAndLongitudeAndAddressToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :latitude, :float
    add_column :campaigns, :longitude, :float
    add_column :campaigns, :address, :string
  end
end
