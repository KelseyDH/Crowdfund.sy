class RewardLevel < ActiveRecord::Base
  belongs_to :campaign
  validates_presence_of :title, :details, :amount

  delegate :title, to: :campaign, prefix: true
  #Without Delegate: reward_level.campaign.title
  
  #With this delegate:  reward_level.campaign_title
  
  #Delegate without prefix (not possible here due to overlap):
  #reward_level.title  
end
