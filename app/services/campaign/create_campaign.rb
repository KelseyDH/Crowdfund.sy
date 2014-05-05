class Campaign::CreateCampaign

  include Virtus.model

  attribute :params, Hash
  attribute :campaign, Campaign

  attribute :user, User

  def call
    @campaign = user.campaign.new(params)
    @campaign.save

  end

end