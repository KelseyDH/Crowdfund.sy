class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :reward_level

  #does not post to model, but allows this to be accessed for stripe:
  attr_accessor :card_number, :card_year, 
                :card_month, :cvc, :stripe_card_token


end
