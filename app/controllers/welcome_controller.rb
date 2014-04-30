class WelcomeController < ApplicationController
  def index
    #@campaigns = Campaign.all
    #Below for paginating display:
    @campaigns = Campaign.paginate(page: params[:page], per_page: 12)
  end
end
