class WelcomeController < ApplicationController
  def index
    @campaigns = Campaign.all
  end
end
