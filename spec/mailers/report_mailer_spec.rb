require "rails_helper"

RSpec.describe ReportMailer, type: :mailer do
  describe "notify_report" do
    let(:mail) { ReportMailer.notify_report }

    it "renders the headers" do
      expect(mail.subject).to eq("Notify report")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
