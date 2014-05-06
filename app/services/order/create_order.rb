class Order::CreateOrder
  #Virtus helps organize Class name for service objects
  include Virtus.model

  attribute :stripe_token, String
  attribute :user, User
  attribute :reward_level, RewardLevel

  attribute :order, Order

  def call
    build_order
      #private method below: build_order

    begin 
      create_customer unless user.stripe_customer_id
        #private method below: create_customer
      
      @order.stripe_txn_id = charge_customer.id
        #private method below: charge_customer


    rescue Stripe::CardError => e
      #e is for raising an exception

      @order.errors.add(:base, "Card Problem")
      
      return false
    
    end
    
    @order.save
      #true
        #^Removed true because order.save returns boolean
  end



  private

  def build_order
    order                    = Order.new
    order.user               = user
    order.reward_level       = reward_level
  end


  def create_customer
      service = Stripe::CreateCustomer.new(user: user, 
                                           stripe_token: stripe_token)
      service.call
  end


  def charge_customer
    charge = Stripe::Charge.create(
      :amount => @reward_level.amount * 100,
      :currency => "cad",
      :customer => user.stripe_customer_id,
      :description => "Pledge for #{@reward_level.campaign_title}"
      )
  end


end