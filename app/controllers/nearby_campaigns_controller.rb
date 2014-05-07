class NearbyCampaignsController < ApplicationController
  
  before_action :authenticate_user!

  def index
    #Another callable method:
    #@nearby_campaigns = Campaign.near(current_user.profile.address)

    #Below code shows nearby campaigns to the user 
    #within 2000 miles of their address on a map:
    @nearby_campaigns = Campaign.near(current_user.address, 2000)

  end


end
