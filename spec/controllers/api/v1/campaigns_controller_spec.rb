require "spec_helper"

describe Api::V1::CampaignsController  do
  
  describe "fetching all campaigns" do
    let!(:campaign_1) { create(:campaign) }
    let!(:campaign_2) { create(:campaign) }


    before do
      get :index, format: :json
    end


    specify { response.body.should include(campaign_1.title)}

    #same as above:
    # it "contains campaign 1 title" do
    #   response.body.should include(campaign_1.title)
    # end
    
    specify { response.body.should include(campaign_2.title) }
    specify { response.body.should include(campaign_1.details) }
    specify { response.body.should include(campaign_2.details) }



  end

end