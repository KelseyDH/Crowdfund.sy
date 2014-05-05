class RewardLevel < ActiveRecord::Base
  belongs_to :campaign
  validates_presence_of :title, :details, :amount
end
