require 'rails_helper'

RSpec.describe SpecialistAdsController, type: :request do
  let(:user) { create(:user) }
  let(:specialist_ad ) { create(:specialist_ad, user: user)}
  let(:valid_attributes) do
    { title: 'Senior Developer', description: 'Experienced developer needed', desired_salary: 120000 }
  end

  let(:invalid_attributes) do
    { title: '', description: '', desired_salary: nil }
  end

  before do
    sign_in user
  end

  describe "GET /index" do
    it "returns http success" do
      get specialist_ads_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      advertisement = FactoryBot.create(:specialist_ad, user: user)
      get specialist_ad_path(advertisement)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new SpecialistAd and redirects" do
        sign_in user
        expect {
          post specialist_ads_path, params: { specialist_ad: valid_attributes }
        }.to change(SpecialistAd, :count).by(1)
        expect(response).to redirect_to(specialist_ads_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new SpecialistAd" do
        sign_in user
        expect {
          post specialist_ads_path, params: { specialist_ad: invalid_attributes }
        }.to change(SpecialistAd, :count).by(0)
        expect(response).to have_http_status(:unprocessable_entity) # Or :success if you render :new template instead of redirecting on failure
      end
    end
  end

  describe "PUT /update" do
    let(:new_attributes) {
      { title: 'Updated Title', description: 'Updated description' }
    }

    it "updates the requested SpecialistAd" do
      sign_in user
      advertisement = FactoryBot.create(:specialist_ad, user: user)
      put specialist_ad_path(advertisement), params: { specialist_ad: new_attributes }
      advertisement.reload
      expect(advertisement.title).to eq('Updated Title')
      expect(response).to redirect_to(specialist_ads_path)
    end

    it "does not update the SpecialistAd with invalid attributes" do
      sign_in user
      advertisement = FactoryBot.create(:specialist_ad, user: user)
      put specialist_ad_path(advertisement), params: { specialist_ad: invalid_attributes }
      advertisement.reload
      expect(advertisement.title).not_to eq('Updated Title') # Assuming 'Updated Title' is invalid
      expect(response).to have_http_status(:unprocessable_entity) # Or :success if you render :edit template instead of redirecting on failure
    end
  end
end

