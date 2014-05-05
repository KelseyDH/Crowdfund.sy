class CampaignsController < ApplicationController

  before_action :authenticate_user!, except: :show

  def index
    @campaigns = current_user.campaigns
  end

  def new
    @campaign = Campaign.new
    3.times { @campaign.reward_levels.build }
  end

  def create
    @campaign = Campaign.new(campaign_params)
    
    #SERVICE OBJECT:
    service = Campaign::CreateCampaign.new(params: campaign_params,
                                          user: current_user)

    #@campaign = current_user.campaigns.new(campaign_params)

    if service.call
      redirect_to service.campaign, notice: "Campaign created successsfully!"
    else
      @campaign = service.campaign
      #(3 - @campaign.reward_levels.length).times {@campaign.reward_levels.build}
      render :new
    end


    # if @campaign.save
    #   redirect_to root_path, notice: "Campaign created successsfully!"
    # else
    #   #(3 - @campaign.reward_levels.length).times {@campaign.reward_levels.build}
    #   render :new
    # end
  end

  def show
    # @campaign = Campaign.find(params[:id])

    #@campaign = Campaign.friendly.find(params[:id]).decorate
    @campaign = Campaign.friendly.find(params[:id])
    @commentable = @campaign
    @comment = Comment.new


    respond_to do |format|
      format.html { render :show }
      format.js { render :show }
    end
  end

  def publish
    
    @campaign = Campaign.friendly.find(params[:id])
    #above uses Friendly gem to replace:
    # @campaign = Campaign.find(params[:id])

    if @campaign.publish
      redirect_to campaigns_path, notice: "Campaign published successfully!"
    else
      redirect_to campaigns_path, alert:  "Campaign publish failed: #{@campaign.errors.full_messages}"
    end  

  end

  private

  def campaign_params
    params.require(:campaign).permit(:title, :details, 
                                    :target, :end_date, 
                                    {reward_levels_attributes: [:title, :details, :amount]})
  end

end
