class OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :find_reward_level

  def new
    @order = Order.new
  end

  def create


    token = params[:order] ? params[:order][:stripe_card_token] : ""
      #used in form for passing stripe token

    service = Order::CreateOrder.new(user: current_user,
                              stripe_token: params[:order][:stripe_card_token],
                              reward_level: @reward_level)

    ##############
    #Before using service objects:
    ###
    # customer = Stripe::Customer.create(
    #   description: "Customer for #{current_user.email} |
    #                 id: #{current_user.id}"
    #   card: params[:order][:stripe_card_token]
    #   )

    # current_user.stripe_customer_id = customer.id
    # current_user.stripe_last4 = customer.cards.data[0].last4
    # current_user.stripe_card_type - customer.cards.data[0].type
    # current_user.save


    # Stripe::Charge.create(
    #   :amount => @reward_level.amount * 100,
    #   #before monthly implementation :amount => 400,
      
    #   :currency => "cad",
    #   #:card => current_user.stripe_customer_id,
    #   #:card => params[:order][:stripe_card_token],
    #   #:description => "Test charge"
    #   :customer => current_user.stripe_customer_id
    #   :description => "Pledge for #{@reward_level.campaign_title}"
    #   )
    #  
    #  #render text: "success"
    #  render text: params[:order][:stripe_card_token]

    ##############

    if service.call 
      redirect_to @reward_level.campaign, notice: "Thanks for pledging!"
    else 
      @order = service.order
      render :new
    end

  end

  private

  def find_reward_level
    @reward_level = RewardLevel.find(params[:reward_level_id])
  end

end
