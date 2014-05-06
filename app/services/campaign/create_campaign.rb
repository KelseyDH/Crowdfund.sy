class Campaign::CreateCampaign

  include Virtus.model

  attribute :params, Hash
  attribute :user, User
  attribute :campaign, Campaign


  def call
    @campaign = user.campaign.new(params)
    @campaign.save
  end

end