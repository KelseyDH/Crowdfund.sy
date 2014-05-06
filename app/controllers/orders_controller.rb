class OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :find_reward_level

  def new
    @order = Order.new
  end

  def create
    
    Stripe::Charge.create(
      :amount => 400,
      :currency => "cad",
      :card => params[:order][:stripe_card_token],
      :description => "Test charge"
      )

    render text: params[:order][:stripe_card_token]


  end

  private

  def find_reward_level
    @reward_level = RewardLevel.find(params[:reward_level_id])
  end

end
