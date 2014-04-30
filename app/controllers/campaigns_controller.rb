class CampaignsController < ApplicationController

  before_action :authenticate_user!, except: :show

  def index
    @campaigns = current_user.campaigns
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      redirect_to root_path, notice: "Campaign created successsfully!"
    else
      render :new
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def publish
    @campaign = Campaign.find(params[:id])
    if @campaign.publish
      redirect_to campaigns_path, notice: "Campaign published successfully!"
    else
    redirect_to campaigns_path, alert:  "Campaign publish failed: #{@campaign.errors.full_messages}"
    end  

  end

  private

  def campaign_params
    params.require(:campaign).permit(:title, :details, 
                                    :target, :end_date)
  end

end
