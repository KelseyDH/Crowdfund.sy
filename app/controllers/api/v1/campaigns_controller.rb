class Api::V1::CampaignsController < ApplicationController

def index
  @campaigns = Campaign.paginate(page: params[:page], per_page: 12)
  render json: @campaigns.to_json
  end

def show
  @campaign = Campaign.find(params[:id])
end

private

def restrict_access
  api_key = ApiKey.find_by_access_token(params[:access_token])
  head :unauthorized unless api_key
end

end