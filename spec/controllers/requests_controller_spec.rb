require 'rails_helper'

RSpec.describe RequestsController, type: :controller do
  describe "POST #create" do
    let(:valid_attributes) { { body: "COFFEE" } } # using an allowed value
    let(:invalid_attributes) { { body: "INVALID_VALUE" } } # a value not in ALLOWED_VALUES

    context "with valid parameters" do
      it "creates a new request" do
        expect {
          post :create, params: { request: valid_attributes }
        }.to change(Request, :count).by(1)
      end

      it "returns a status of :created" do
        post :create, params: { request: valid_attributes }
        expect(response).to have_http_status(:created)
      end

      it "returns the created request in the response body" do
        post :create, params: { request: valid_attributes }
        expect(JSON.parse(response.body)["body"]).to eq("COFFEE")
      end

      it "calls the RequestMailer.notify_request method" do
        expect(RequestMailer).to receive(:notify_request).with("COFFEE").and_call_original
        post :create, params: { request: valid_attributes }
      end
    end

    context "with invalid parameters" do
      it "does not create a new request" do
        expect {
          post :create, params: { request: invalid_attributes }
        }.not_to change(Request, :count)
      end

      it "returns a status of :unprocessable_entity" do
        post :create, params: { request: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "returns error messages in the response body" do
        post :create, params: { request: invalid_attributes }
        expect(JSON.parse(response.body)).to include("body")
        expect(JSON.parse(response.body)["body"]).to include("Must be one of: WATER, COFFEE, TOILET PAPER, SOAP")
      end
    end
  end
end