require "sib-api-v3-sdk"
require "dotenv/load"

# Configure the API key
SibApiV3Sdk.configure do |config|
  config.api_key["api-key"] = ENV["MAIL_KEY"]
end

# Instantiate the API client
api_instance = SibApiV3Sdk::EmailCampaignsApi.new
