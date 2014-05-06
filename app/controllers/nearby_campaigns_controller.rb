class NearbyCampaignsController < ApplicationController
  
  before_action :authenticate_user!

  def index
    #@nearby_campaigns = Campaign.near(current_user.profile.address)
    @nearby_campaigns = Campaign.near(current_user.address, 30)
  end


end
