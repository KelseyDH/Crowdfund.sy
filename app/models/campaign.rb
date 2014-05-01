class Campaign < ActiveRecord::Base
  belongs_to :user

  has_many :comments, as: :commentable

  scope :published, -> {where(state: :published)}

  state_machine :state, initial: :draft do

    event :publish do
      transition draft: :published
    end

    event :complete do
      transition published: :target_met
    end

    event :expire do
      transition target_met: :succeeded, published: :failed
    end

    event :cancel do
      transition [:draft, :published, :target_met] => :canceled
    end

    after_transition on: :canceled, do: :refund_all_pledges
    
  end

  def refund_all_pledges
    #code to schedule bg task to refund all
  end


end
