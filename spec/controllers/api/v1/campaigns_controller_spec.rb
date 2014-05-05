require "spec_helper"

describe Api::V1::CampaignsController  do
  
  render_views
    context "with valid APi key" do
      let(:user) { create(:user) }
      describe "fetching all campaigns" do
        let!(:campaign_1) { create(:campaign) }
        let!(:campaign_2) { create(:campaign) }


        before do
          get :index, format: :json, access_token: user.api_key.access_token
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

      describe "fetching single campaign" do
        let(:campaign) { create(:campaign) }

        before do
          get :show, id: campaign.id, format: :json
        end

        it "includes campaign's title" do
          body_json = JSON.parse(response.body)
          expect(body_json["title"]).to eq(campaign.title)
        end

      end
    end
end