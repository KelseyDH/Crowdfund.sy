class WelcomeController < ApplicationController
  def index
    #@campaigns = Campaign.all
    #Below for paginating display:
    @campaigns = Campaign.published.paginate(page: params[:page], per_page: 12).order("created_at desc")
    respond_to do |format|
      format.html { render :index}
      format.js { render :index }
    end
  end
end
