class Stripe::CreateCustomer
  include Virtus.model

  attribute :user, User #allows us to replace current_user with user.X
  attribute :stripe_token, String

  def call

    customer = Stripe::Customer.create(
                      description: default_description,
                      card:        stripe_token
      )

    user.stripe_customer_id = customer.id
    user.stripe_last4 = customer.cards.data[0].last4
    user.stripe_card_type - customer.cards.data[0].type
    user.save
  end

  private

  def default_description
    "Customer for @{user.email} | id: #{user.id}"
  end

end